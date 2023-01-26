<?php

namespace Aplikacija\Kontroleriai;

use Aplikacija\FS;
use Aplikacija\Response;
use Aplikacija\Request;
class PradziaController extends BaseController
{
    public function index(Request $request): Response
    {
        return $this->render('pradzia', $request->all());
    }
}