$(document).ready(function(){
    validator.message['date'] = 'not a real date';

// validate a field on "blur" event, a 'select' on 'change' event & a '.reuired' classed multifield on 'keyup':

    $('.dateBirth').daterangepicker({
        singleDatePicker: true,
        calender_style: "picker_2"
    }, function (start, end, label) {
        console.log(start.toISOString(), end.toISOString(), label);
    });

    $('#diffdate').daterangepicker(null, function (start, end, label) {
        console.log(start.toISOString(), end.toISOString(), label);
    });

    var oTable = $('#example').dataTable({
        "oLanguage": {
            "sSearch": "Search User:"
        },
        'iDisplayLength': 12,
        "sPaginationType": "full_numbers",
        "dom": 'T<"clear">lfrtip'

    });

//$('form')
//    .on('blur', 'input[required], input.optional, select.required', validator.checkField)
//    .on('change', 'select.required', validator.checkField)
//    .on('keypress', 'input[required][pattern]', validator.keypress);
//
//$('.multi.required')
//    .on('keyup blur', 'input', function () {
//        validator.checkField.apply($(this).siblings().last()[0]);
//    });
//
//// bind the validation to the form submit event
////$('#send').click('submit');//.prop('disabled', true);
//
//$('form').submit(function (e) {
//    e.preventDefault();
//    var submit = true;
//    // evaluate the form using generic validaing
//    if (!validator.checkAll($(this))) {
//        submit = false;
//    }
//
//    if (submit)
//        this.submit();
//    return false;
//});
//
///* FOR DEMO ONLY */
//$('#vfields').change(function () {
//    $('form').toggleClass('mode2');
//}).prop('checked', false);
//
//$('#alerts').change(function () {
//    validator.defaults.alerts = (this.checked) ? false : true;
//    if (this.checked)
//        $('form .alert').remove();
//}).prop('checked', false);
});

