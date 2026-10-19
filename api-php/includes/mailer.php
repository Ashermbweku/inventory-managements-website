<?php
require_once dirname(__DIR__).'/config/env.php';
function send_mail_message($to,$subject,$html){
  $from=envv('MAIL_FROM_ADDRESS'); $name=envv('MAIL_FROM_NAME','Mhofu Yemukomo Company');
  if(!$from) return false;
  $headers="MIME-Version: 1.0\r\nContent-type: text/html; charset=UTF-8\r\nFrom: {$name} <{$from}>\r\n";
  return @mail($to,$subject,$html,$headers);
}
