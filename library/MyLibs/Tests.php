<?php
namespace MyLibs;

/**
 * Class Tests
 * Класс для тестирование
 *
 * @package MyLibs
 */
class Tests {
    static $error_eval = '';
    static $error_mess = '';
    static function checkValues($var1,$var2) {
        if($var1 !== $var2) {
            echo htmlspecialchars($var1).' !== '.htmlspecialchars($var2).'<hr>';
            echo '<pre>'.print_r(debug_backtrace(),1);
            exit;
        }
        return true;
    }

    static function checkError($eval,$mess) {
        set_error_handler(function($errno, $errstr, $errfile, $errline){
            if(Tests::$error_mess !== $errstr) {
                echo $errno.' <b>'.$errstr.'</b> '.$errfile.''.$errline.'<br>';
                echo htmlspecialchars('Tests_mess - '.Tests::$error_eval).' - '.htmlspecialchars(Tests::$error_mess).'<hr>';
                echo '<pre>'.print_r(debug_backtrace(), 1);
                exit;
            }
        });
        self::$error_eval = $eval;
        self::$error_mess = $mess;
        eval($eval);
        restore_error_handler();

    }

    static function checkException($eval,$mess) {
        try {
            eval($eval);
            echo 'Error: No Exception';
            exit;
        } catch(Exception $e) {
            if($mess !== $e->getMessage()) {
                echo 'Wrong Exception: '.$mess.', must be: '.$e->getMessage();
                exit;
            }
            return;
        }
    }
}