<?php

namespace Config;

// Create a new instance of our RouteCollection class.
$routes = Services::routes();

// Load the system's routing file first, so that the app and ENVIRONMENT
// can override as needed.
if (file_exists(SYSTEMPATH . 'Config/Routes.php')) {
    require SYSTEMPATH . 'Config/Routes.php';
}

/*
 * --------------------------------------------------------------------
 * Router Setup
 * --------------------------------------------------------------------
 */
$routes->setDefaultNamespace('App\Controllers');
$routes->setDefaultController('Home');
$routes->setDefaultMethod('index');
$routes->setTranslateURIDashes(false);
$routes->set404Override();
$routes->setAutoRoute(false);

/*
 * --------------------------------------------------------------------
 * Route Definitions
 * --------------------------------------------------------------------
 */

// We get a performance increase by specifying the default
// route since we don't have to scan directories.
$routes->get('/', 'Home::index');
$routes->post('/', 'IdController::connexion');


$routes->get('Quiz', 'Questions::index');
$routes->match(['get','post'],'Questions/create', 'Questions::create');
$routes->get('Questions/(:segment)', 'Questions::questionDisplay/$1');


$routes->get('surnames/(:segment)', 'Surnames::view/$1');
$routes->get('surnames', 'Surnames::index');
$routes->match(['get','post'],'IdView/inscription', 'IdController::create');
$routes->get('IdView/(:segment)', 'IdController::view/$1');
$routes->get('IdView', 'IdController::index');
$routes->get('Logout', 'IdController::logout');
$routes->get('result', 'Result::index');
$routes->get('poireTest', 'PoireTest::index');
$routes->match(['get','post'],'/start', 'Start::index');
$routes->get('(:any)', 'Pages::view/$1');
/*
 * --------------------------------------------------------------------
 * Additional Routing
 * --------------------------------------------------------------------
 *
 * There will often be times that you need additional routing and you
 * need it to be able to override any defaults in this file. Environment
 * based routes is one such time. require() additional route files here
 * to make that happen.
 *
 * You will have access to the $routes object within that file without
 * needing to reload it.
 */
if (file_exists(APPPATH . 'Config/' . ENVIRONMENT . '/Routes.php')) {
    require APPPATH . 'Config/' . ENVIRONMENT . '/Routes.php';
}
