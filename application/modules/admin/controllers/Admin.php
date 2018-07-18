<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Admin extends MX_Controller {

    function __construct()
    {
        parent::__construct();
    }

    public function index(){
       $this->load->view('LoginForm');
        
    }
    public function new()
    {
        echo "Admin Add new page";
        # code...
    }
    public function edit()
    {
       echo "admin edit page";
        # code...
    }
    public function delete()
    {
        echo "admin delete";
        # code...
    }
    public function lists()
    {
        echo "Admin list"; 
        # code...
    }
    public function do_login()
    {
        echo "Admin Login";
        # code...
    }
    public function logout()
    {
        echo "admin logout";
        # code...
    }
}
