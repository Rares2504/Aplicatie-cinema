<?php
    $routes = [
        "aplicatie_cinema/movies/index" =>["MovieController", "index"],
        "aplicatie_cinema/movies/createMovie.php" =>["MovieController", "createMovie"],
        "aplicatie_cinema/movies/displayImage.php" =>["MovieController", "displayImage"],
        "aplicatie_cinema/movies/deleteMovie.php" =>["MovieController", "deleteMovie"],
        "aplicatie_cinema/movies/editMovie.php" =>["MovieController", "editMovie"],
        "aplicatie_cinema/movies/doEditMovie.php" =>["MovieController", "doEditMovie"]
    ];

    class Router {
        private $uri;
    
        public function __construct() {
            // Get the current URI
            $this->uri = trim($_SERVER["REQUEST_URI"], "/");
            $this->uri = strtok($this->uri, '?');
        }
        
        public function direct() {
            global $routes;
            $this->uri=strtok($this->uri, '?');
            if (array_key_exists($this->uri, $routes)) {
                // Get the controller and method
                // Load the controller file if it hasn't been autoloaded
                [$controller, $method] = $routes[$this->uri];
                require_once "app/controllers/{$controller}.php";
    
                // Call the method
                return $controller::$method();
            }
            require_once "app/views/404.php";
        }
    }
?>