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


    // input tag
    $('#tags_1').tagsInput({
        width: 'auto'
    });


    // ajax calling for add comments for task....
    $("#submitComment").on("click",function(){

        var comment = $("#taskComment").val();
        var task_id = $("#taskId").val();
        var user_id = $("#userId").val();

        $.ajax({
            type: "POST",
            url: "/comments/create",
            data: { comment: { comments: comment, task_id: task_id,users_id:user_id } },
            success:function(response){
                if(response.status == true){
                    window.location.href = "/tasks/"+task_id+"";
                }

            }

        })
    });

    // ajax calling for complete the task....
    $(".submitTask").on("click",function(){

        var user_id = $(this).parent().find('.user_val').val();
        var task_id = $(this).parent().find('.task_id_val').val();
        var status = $(this).parent().find('.status_val').val();

        $.ajax({
            type: "POST",
            url: "/tasks/updatedata",
            data: { tasks: { completed_by: user_id, id: task_id,status:status } },
            success:function(response){
                if(response.status == true){
                    window.location.href = "/tasks/"+task_id+"";
                }

            }

        })

    })
})


function onAddTag(tag) {
    alert("Added a tag: " + tag);
}

function onRemoveTag(tag) {
    alert("Removed a tag: " + tag);
}

function onChangeTag(input, tag) {
    alert("Changed a tag: " + tag);
}

$(window).load(function () {

    var date = new Date();
    var d = date.getDate();
    var m = date.getMonth();
    var y = date.getFullYear();
    var started;
    var ended;
    var categoryClass;

    var calendar = $('#calendar').fullCalendar({
        header: {
            left: 'prev,next today',
            center: 'title',
            right: 'month,agendaWeek,agendaDay'
        },
        selectable: true,
        selectHelper: true,
        select: function (start, end, allDay) {
            $('#fc_create').click();

            started = start;
            ended = end

            $('body').find('#event_start').val(started.format("YYYY-MM-DD"));
            $('body').find('#event_end').val(ended.format("YYYY-MM-DD"));

            $("#send").on("click", function () {
                var title = $("#event_title").val();
                if (end) {
                    ended = end
                }

            });
        },
        eventClick: function (calEvent, jsEvent, view) {
            //alert(calEvent.title, jsEvent, view);

            $('#fc_edit').trigger('click');
            console.log($('body').find('#event_title').val(calEvent.title));

            $('body').find('#send').hide();
            $('body').find('#update').removeClass('hide');

            if(calEvent.end != null){
                end = calEvent.end.format("YYYY-MM-DD");
            }
            else{
                end = calEvent.start.format("YYYY-MM-DD");
            }

            $('body').find('#event_title').val(calEvent.title);
            $('body').find('#event_description').val(calEvent.description);
            $('body').find('#event_start').val(calEvent.start.format("YYYY-MM-DD"));
            $('body').find('#event_end').val(end);

            $("#update").unbind().on("click", function () {

                $.ajax({
                    type: "PUT",
                    url: "/events/"+calEvent.id,
                    data: $("#new_event").serialize(),
                    success:function(response){
                        $("#new_event").trigger('reset');
                    }

                })

                calEvent.title = $("#event_title").val();

                calendar.fullCalendar('updateEvent', calEvent);
                $('#event_close').click();
            });
            calendar.fullCalendar('unselect');
        },
        editable: true,
        eventDrop: function(event, delta, revertFunc) {
            var id = $(this).attr('id');
            var end;

            if(event.end != null){
                end = event.end.format();
            }
            else{
                end = event.start.format();
            }

            $.ajax({
                type: "PUT",
                url: "/events/"+id,
                data: { event: { start: event.start.format(), id: id,end:end,description:event.description,title:event.title} },
                success:function(response){

                }

            })

        },
        eventAfterRender:function( event, element, view ) {
            element.parent().append( "<span class='closeon'>X</span>" );
            $(element).attr("id",event._id);
            element.parent().find(".closeon").unbind().click(function() {

                $.ajax({
                    type: "DELETE",
                    url: "/events/"+event._id,
                    success:function(response){
                        $('#calendar').fullCalendar('removeEvents',event._id);
                    }
                })
            });
        },
        events: 'events.json'
    });
});

$(document).ready(function(){

    $(document).bind('ajaxError', 'form#new_event', function(event, jqxhr, settings, exception){
        if(jqxhr.status == 201)
        {
            console.log(jqxhr.responseText);
            $('#calendar').fullCalendar('renderEvent', $.parseJSON(jqxhr.responseText) ,
                true // make the event "stick"
            );

            $('#calendar').fullCalendar('unselect');
            $(event.data).modal_success();

        }
        else{
            // note: jqxhr.responseJSON undefined, parsing responseText instead
            $(event.data).render_form_errors( $.parseJSON(jqxhr.responseText) );
        }


    });

});

(function($) {

    $.fn.modal_success = function(){

        // clear form input elements
        // todo/note: handle textarea, select, etc
        this.trigger('reset');
        console.log(this.find("input[type='text']"));
        // clear error state
        this.clear_previous_errors();

        this.find('#event_close').click();
    };

    $.fn.render_form_errors = function(errors){

        $form = this;
        this.clear_previous_errors();
        model = this.data('model');

        // show error messages in input form-group help-block
        $.each(errors, function(field, messages){
            $input = $('input[name="' + model + '[' + field + ']"]');
            console.log($input);
            $input.closest('.form-group').addClass('has-error').find('.help-block').html( messages.join(' & ') );
        });

    };

    $.fn.clear_previous_errors = function(){
        $('.form-group.has-error', this).each(function(){
            $('.help-block', $(this)).html('');
            $(this).removeClass('has-error');
        });
    }

}(jQuery));
