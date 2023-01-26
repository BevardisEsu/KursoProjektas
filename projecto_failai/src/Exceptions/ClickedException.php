<?php

namespace Aplikacija\Exceptions;
use Exception;
class ClickedException extends Exception
{
    public function __construct($message = "Paspaustas puslapis: Kontaktai", $code = 444)
    {
        parent::__construct($message, $code);
    }

}
