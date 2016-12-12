function show_on_left(t){
	if (t == 'new'){
		document.getElementById('existing-tab').style.display = 'none';
		document.getElementById('new-tab').style.display = 'block';

	}
	if (t == 'existing'){
		document.getElementById('new-tab').style.display = 'none';
		document.getElementById('existing-tab').style.display = 'block';
	}
}

function validateForm(){
	var cvv, card_number, cvv_error;

	card_number = document.getElementById('field-card-number').value;
    cvv = document.getElementById('field-cvv').value;

    if (isNaN(card_number) || card_number.length!=16){
    	card_number_error = "Card number must be 16 digits";
        console.log(card_number_error);
        document.getElementById("form-errors").innerHTML = card_number_error;
        return false;
    }

    if (isNaN(cvv) || cvv < 1 || cvv > 999 || cvv.length != 3) {
        cvv_error = "CVV not valid";
        console.log(cvv_error);
        document.getElementById("form-errors").innerHTML = cvv_error;
        return false;
    }

	return true;

}