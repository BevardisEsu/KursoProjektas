<?php

namespace Aplikacija\Exceptions;

class NonVerbalException extends \Exception
{
    public function __construct()
    {
        parent::__construct('Neteisingi prisijungimo duomenys', 401);
    }
}