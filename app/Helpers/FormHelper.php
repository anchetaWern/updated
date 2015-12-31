<?php
class FormHelper {

    public static function isSelected($current_value, $selected_value){
        return ($current_value == $selected_value) ? 'selected' : '';
    }

    public static function isChecked($enabled){
    	return ((bool)$enabled === true) ? 'checked' : '';
    }
}