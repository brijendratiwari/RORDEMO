$(document).ready(function(){
    validator.message['date'] = 'not a real date';

// validate a field on "blur" event, a 'select' on 'change' event & a '.reuired' classed multifield on 'keyup':

    $('.dateBirth').daterangepicker({
        singleDatePicker: true,
        calender_style: "picker_2"
    }, function (start, end, label) {
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

    //for profile show
    var cb = function (start, end, label) {
        console.log(start.toISOString(), end.toISOString(), label);
        $('#reportrange span').html(start.format('MMMM D, YYYY') + ' - ' + end.format('MMMM D, YYYY'));
        //alert("Callback has fired: [" + start.format('MMMM D, YYYY') + " to " + end.format('MMMM D, YYYY') + ", label = " + label + "]");
    }

    var optionSet1 = {
        startDate: moment().subtract(29, 'days'),
        endDate: moment(),
        minDate: '01/01/2012',
        maxDate: '12/31/2015',
        dateLimit: {
            days: 60
        },
        showDropdowns: true,
        showWeekNumbers: true,
        timePicker: false,
        timePickerIncrement: 1,
        timePicker12Hour: true,
        ranges: {
            'Today': [moment(), moment()],
            'Yesterday': [moment().subtract(1, 'days'), moment().subtract(1, 'days')],
            'Last 7 Days': [moment().subtract(6, 'days'), moment()],
            'Last 30 Days': [moment().subtract(29, 'days'), moment()],
            'This Month': [moment().startOf('month'), moment().endOf('month')],
            'Last Month': [moment().subtract(1, 'month').startOf('month'), moment().subtract(1, 'month').endOf('month')]
        },
        opens: 'left',
        buttonClasses: ['btn btn-default'],
        applyClass: 'btn-small btn-primary',
        cancelClass: 'btn-small',
        format: 'MM/DD/YYYY',
        separator: ' to ',
        locale: {
            applyLabel: 'Submit',
            cancelLabel: 'Clear',
            fromLabel: 'From',
            toLabel: 'To',
            customRangeLabel: 'Custom',
            daysOfWeek: ['Su', 'Mo', 'Tu', 'We', 'Th', 'Fr', 'Sa'],
            monthNames: ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'],
            firstDay: 1
        }
    };
    $('#reportrange span').html(moment().subtract(29, 'days').format('MMMM D, YYYY') + ' - ' + moment().format('MMMM D, YYYY'));
    $('#reportrange').daterangepicker(optionSet1, cb);
    $('#reportrange').on('show.daterangepicker', function () {
        console.log("show event fired");
    });
    $('#reportrange').on('hide.daterangepicker', function () {
        console.log("hide event fired");
    });
    $('#reportrange').on('apply.daterangepicker', function (ev, picker) {
        console.log("apply event fired, start/end dates are " + picker.startDate.format('MMMM D, YYYY') + " to " + picker.endDate.format('MMMM D, YYYY'));
    });
    $('#reportrange').on('cancel.daterangepicker', function (ev, picker) {
        console.log("cancel event fired");
    });
    $('#options1').click(function () {
        $('#reportrange').data('daterangepicker').setOptions(optionSet1, cb);
    });
    $('#options2').click(function () {
        $('#reportrange').data('daterangepicker').setOptions(optionSet2, cb);
    });
    $('#destroy').click(function () {
        $('#reportrange').data('daterangepicker').remove();
    });

    var day_data = [
        {
            "period": "Jan",
            "Hours worked": 80
        },
        {
            "period": "Feb",
            "Hours worked": 125
        },
        {
            "period": "Mar",
            "Hours worked": 176
        },
        {
            "period": "Apr",
            "Hours worked": 224
        },
        {
            "period": "May",
            "Hours worked": 265
        },
        {
            "period": "Jun",
            "Hours worked": 314
        },
        {
            "period": "Jul",
            "Hours worked": 347
        },
        {
            "period": "Aug",
            "Hours worked": 287
        },
        {
            "period": "Sep",
            "Hours worked": 240
        },
        {
            "period": "Oct",
            "Hours worked": 211
        }
    ];
    Morris.Bar({
        element: 'graph_bar',
        data: day_data,
        xkey: 'period',
        hideHover: 'auto',
        barColors: ['#26B99A', '#34495E', '#ACADAC', '#3498DB'],
        ykeys: ['Hours worked', 'sorned'],
        labels: ['Hours worked', 'SORN'],
        xLabelAngle: 60
    });

    // input tag
    $('#tags_1').tagsInput({
        width: 'auto'
    });

});
function onAddTag(tag) {
    alert("Added a tag: " + tag);
}

function onRemoveTag(tag) {
    alert("Removed a tag: " + tag);
}

function onChangeTag(input, tag) {
    alert("Changed a tag: " + tag);
}

