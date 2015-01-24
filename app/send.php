<?php
  
  // save to database
  
  // count unviewed entries
  
  // return number of entries in line


if (is_ajax()) {
  if (isset($_POST["message"]) && !empty($_POST["message"])) { //Checks if message value exists
    $message = $_POST["message"];
    return json_encode(94);
  }
}

// check if the request is an AJAX request
function is_ajax() {
  return isset($_SERVER['HTTP_X_REQUESTED_WITH']) && strtolower($_SERVER['HTTP_X_REQUESTED_WITH']) == 'xmlhttprequest';
}

/*
function test_function(){
  $return = $_POST;
  
  //Do what you need to do with the info. The following are some examples.
  //if ($return["favorite_beverage"] == ""){
  //  $return["favorite_beverage"] = "Coke";
  //}
  //$return["favorite_restaurant"] = "McDonald's";
  
  $return["json"] = json_encode($return);
  echo json_encode($return);
}
*/
?>