var allergyCheckbox = document.getElementById('user_allergy');
var allergyDescription = document.getElementById('user_allergyDescription');
allergyCheckbox.onchange = function() {
 if(this.checked) {
   allergyDescription.removeAttribute('disabled');
 } else {
   allergyDescription.setAttribute('disabled','disabled');
 }
};

var cancerCheckbox = document.getElementById('user_cancer');
var cancerDescription = document.getElementById('user_cancerDescription');
cancerCheckbox.onchange = function() {
 if(this.checked) {
   cancerDescription.removeAttribute('disabled');
 } else {
   cancerDescription.setAttribute('disabled','disabled');
 }
};

var surgeryCheckbox = document.getElementById('user_surgery');
var surgeryDescription = document.getElementById('user_surgeryDescription');
surgeryCheckbox.onchange = function() {
 if(this.checked) {
   surgeryDescription.removeAttribute('disabled');
 } else {
   surgeryDescription.setAttribute('disabled','disabled');
 }
};