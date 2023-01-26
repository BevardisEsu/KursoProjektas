<?php

namespace Aplikacija\Kontroleriai;

use Aplikacija\Authentication;
use Aplikacija\Exceptions\UnauthenticatedException;
use Aplikacija\HtmlRender;
use Aplikacija\Request;
use Aplikacija\Response;
use JetBrains\PhpStorm\NoReturn;

class AdminController extends BaseController
{
    public function __construct(protected Authentication $authenticator, HtmlRender $htmlRender, Response $response)
    {
        parent::__construct($htmlRender, $response);
    }

    /**
     * @throws UnauthenticatedException
     */
    public function index(): Response
    {
        if (!$this->authenticator->isLoggedIn()) {
            throw new UnauthenticatedException();
        }

        return $this->render('admin/dashboard', ['username' => $_SESSION['username']]);
    }

    /**
     * @throws UnauthenticatedException
     */
    public function login(Request $request): Response
    {
        $userName = $request->get('username');
        $password = $request->get('password');

        if(empty($userName) && empty($password)) {
            return $this->redirect('/', ['message' => 'Nesupildyti prisijungimo duomenys']);
        }

        $this->authenticator->login($userName, $password);
        return $this->redirect('/admin', ['message' => 'Sveikiname prisijungus']);
    }

    #[NoReturn] public function logout(): Response
    {
        $this->authenticator->logout();
    }
}