<?php
class Url {

	public static function getRedirect($url){
		$ch = curl_init($url);
		curl_setopt($ch, CURLOPT_HEADER, 1);
		curl_setopt($ch, CURLOPT_NOBODY, 1);
		curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
		$headers = curl_exec($ch);
		curl_close($ch);

		if(preg_match('/^Location: (.+)$/im', $headers, $matches)){
		    return trim($matches[1]);
		}

		return $url;
	}
}