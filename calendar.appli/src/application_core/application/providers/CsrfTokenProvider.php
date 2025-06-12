<?php


namespace calendar\core\application_core\application\providers;

use calendar\core\application_core\application\exceptions\CsrfTokenException;

class CsrfTokenProvider
{
    public static function generate(): string
    {
        if (session_status() !== PHP_SESSION_ACTIVE) {
            session_start();
        }
        $token = bin2hex(random_bytes(32));
        $_SESSION['csrf_token'] = $token;
        return $token;
    }

    public static function check(string $token): void
    {
        if (session_status() !== PHP_SESSION_ACTIVE) {
            session_start();
        }
        if (!isset($_SESSION['csrf_token']) || !hash_equals($_SESSION['csrf_token'], $token)) {
            unset($_SESSION['csrf_token']);
            throw new CsrfTokenException('CSRF token invalide');
        }
        unset($_SESSION['csrf_token']);
    }
}
