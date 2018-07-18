<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Admin extends MX_Controller {

    function __construct()
    {
        parent::__construct();
        $this->load->model('ModelLogin');
      
    }

    public function index(){
        $sess = $this->session->get_userdata();
        if ((isset($sess['status'])) && ($sess['status'] === 'login')){
            echo 'loggedin<br/>';
            echo '<a href="'.site_url('admin/logout').'">Logout</a>';
        }
        else{
            $this->load->view('LoginForm');
        }
        
    }
    public function new()
    {
        echo "Admin Add new page";
        echo '<a href="'. site_url('admin/lists').'">Link</a>';
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
        $email = $this->input->post('email');
        $password = $this->input->post('password');
        
		$where = array(
			'email' => $email,
			'password' => $password
			);
		$cek = $this->ModelLogin->cek_login("tbl_admin_login",$where)->num_rows();
		if($cek > 0){
 
			$data_session = array(
				'email' => $email,
				'status' => "login"
				);
 
			$this->session->set_userdata($data_session);
                // echo 'loggedin<br/>';
             redirect(base_url("admin"));
            // echo '<a href="'.site_url('admin/logout').'">Logout</a>';
            // $this->index();
 
		}else{
			echo "Username dan password salah !";
		}
    }
    public function logout()
    {
        $this->session->sess_destroy();
        redirect(base_url("admin"));
        # code...
    }
}
