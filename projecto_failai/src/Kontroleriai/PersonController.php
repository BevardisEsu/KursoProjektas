<?php

namespace Aplikacija\Kontroleriai;

use Aplikacija\Configs;
use Aplikacija\Database;
use Aplikacija\Exceptions\ValidatorException;
use Aplikacija\FS;
use Aplikacija\HtmlRender;
use Aplikacija\Managers\PersonsManager;
use Aplikacija\Request;
use Aplikacija\Response;
use Aplikacija\Validator;

class PersonController extends BaseController
{
    public const TITLE = 'Asmenys';

    public function __construct(protected PersonsManager $manager, HtmlRender $htmlRender, Response $response){

        parent::__construct($htmlRender, $response);

    }
    public function new(): Response
    {
//      Nuskaitomas HTML failas ir siunciam jo teksta i Output klase
        $failoSistema = new FS('../src/html/person/new.html');
        $failoTurinys = $failoSistema->getFailoTurinys();

        return $this->response($failoTurinys);
    }


    public function list(Request $request): Response
    {
// TODO: Perkelti Filtravima
//
//        $kiekis = $request->get('amount', 10);
//        $orderBy = $request->get('orderby', 'id');
//
//        $searchQuery = '';
//        $params = [];
//        $search = $request->get('search');
//        if ($search) {
//            $searchQuery = "WHERE first_name LIKE :search OR last_name LIKE :search OR code LIKE :search";
//            $params['search'] = '%' . $search . '%';
//        }

        $asmenys = $this->manager->getAll();

        $rez = $this->generatePersonsTable($asmenys);

        return $this->render('person/list', $rez);
    }


    /**
     * @throws ValidatorException
     */
    public function store(Request $request): Response
    {
        $vardas = $_POST['vardas'] ?? '';
        $pavarde = $_POST['pavarde'] ?? '';
        $kodas = (int)$_POST['kodas'] ?? '';

        Validator::required($vardas);
        Validator::required($pavarde);
        Validator::required($kodas);
        Validator::numeric($kodas);
        Validator::asmensKodas($kodas);

        $this->manager->storeIDB();

        return $this->redirect('/persons', ['message' => "Record created successfully"]);
    }

    public function delete(): Response
    {
        $kuris = (int)$_GET['id'] ?? null;

        Validator::required($kuris);
        Validator::numeric($kuris);
        Validator::min($kuris, 1);

        $conf = new Configs();
        $db = new Database($conf);

        $db->query("DELETE FROM `persons` WHERE `id` = :id", ['id' => $kuris]);

        return $this->redirect('/persons', ['message' => "Record deleted successfully"]);
    }

    public function edit(): Response
    {
        $failoSistema = new FS('../src/html/person/edit.html');
        $failoTurinys = $failoSistema->getFailoTurinys();

        $conf = new Configs();
        $db = new Database($conf);

        $person = $db->query("SELECT * FROM `persons` WHERE `id` = :id", ['id' => $_GET['id']])[0];

        foreach ($person as $key => $item) {
            $failoTurinys = str_replace("{{" . $key . "}}", $item, $failoTurinys);
        }

        return $this->response($failoTurinys);
    }

    public function update(Request $request): Response
    {


        Validator::required($request->get('first_name'));
        Validator::required($request->get('last_name'));
        Validator::required($request->get('code'));
        Validator::numeric($request->get('code'));
        Validator::asmensKodas($request->get('code'));

        $conf = new Configs();
        $db = new Database($conf);

        $db->query(
            "UPDATE `persons` SET `first_name` = :vardas, `last_name` = :pavarde, `code` = :kodas, `email` = :email,
                     `phone` = :tel, `address_id` = :addr_id WHERE `id` = :id", $request->all() );

        $response = new Response("Record updated successfully");
        $response->redirect('/persons');
        return $response;
    }

    public function show(): Response
    {
        $failoSistema = new FS('../src/html/person/show.html');
        $failoTurinys = $failoSistema->getFailoTurinys();

        $conf = new Configs();
        $db = new Database($conf);

        $person = $db->query("SELECT * FROM `persons` WHERE `id` = :id", ['id' => $_GET['id']])[0];

        foreach ($person as $key => $item) {
            $failoTurinys = str_replace("{{" . $key . "}}", $item, $failoTurinys);
        }

        return $this->response($failoTurinys);
    }

    /**
     * @param mixed $asmuo
     * @return string
     */
    protected function generatePersonRow(array $asmuo): string
    {
        $failoSistema = new FS('../src/html/person/person_row.html');
        $failoTurinys = $failoSistema->getFailoTurinys();
        foreach ($asmuo as $key => $item) {
            $failoTurinys = str_replace("{{" . $key . "}}", $item??'', $failoTurinys);
        }

        return $failoTurinys;
    }

    /**
     * @param array $asmenys
     * @return string
     */
    protected function generatePersonsTable(array $asmenys): string
    {
        $rez = '<table class="highlight striped">
            <tr>
                <th>ID</th>
                <th>Vardas</th>
                <th>Pavarde</th>
                <th>Emailas</th>
                <th>Asmens kodas</th>
                <th><a href="/persons?orderby=phone">TEl</a></th>
                <th>Addr.ID</th>
                <th>Veiksmai</th>
            </tr>';
        foreach ($asmenys as $asmuo) {
            $rez .= $this->generatePersonRow($asmuo);
        }
        $rez .= '</table>';
        return $rez;
    }
}