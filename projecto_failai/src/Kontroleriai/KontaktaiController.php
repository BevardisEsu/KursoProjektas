<?php

namespace Aplikacija\Kontroleriai;

use Aplikacija\Response;

class KontaktaiController extends BaseController
{
    public function index(): Response
    {
        return $this->render('kontaktai');
    }
}