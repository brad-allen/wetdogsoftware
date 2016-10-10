
//Ajax calls

function GetFields(model, controller)
{
    var xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function() 
    {
        if (this.readyState == 4 && this.status == 200) 
        {

            response = $.parseJSON(this.responseText);
            grid = "";

            console.log(response);


            $.each(response, function(index,item) 
            {     
                name = $.parseJSON(item).name;
                field_type = $.parseJSON(item).field_type;
                   
                console.log(item);
                console.log(name);
                console.log(field_type);


                //Build a form with thse fields...

                //TODO CLeanup!
                //grid = grid + '<table width="90%" class="table table-hover"><tbody><tr><td>' + item.name + '</td>' 
                 //       + '<td>' + item.name + '</td>'
                  //      + '<td>' + item.type + '</td>' 
                    // + profileId == -1 ? '' : ('<td>' + '<button class="glyphicon glyphicon-edit btn-link" type="button" title="Profile"  onclick="Get(' + item.id + ', \'' + controller + '\')"></button>' + '</td>') +
                    //    '</tr></tbody></table>';
            });

            document.getElementById("pageBody").innerHTML = grid
        }
    };
    xhttp.open("GET",  'get_' + model + '_fields', true);
    xhttp.send();
}



function Create(model, json)
{
    
}

function Update(id, model, json)
{
    
}

function Get(id, controller)
{
    var xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function() 
    {
        if (this.readyState == 4 && this.status == 200) 
        {
            document.getElementById("pageBody").innerHTML = this.responseText;
        }
    };
    xhttp.open("GET", controller + "/" + id, true);
    xhttp.send();
}

function GetList(profileId, controller)//, filter, sortBy, sortOrder)
{
    var xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function() 
    {
        if (this.readyState == 4 && this.status == 200) 
        {
            document.getElementById("pageBody").innerHTML = HandleGrid(this.responseText, controller, profileId);
        }
    };
    xhttp.open("GET",  controller, true);
    xhttp.send();
    
}

function GetListHeaders(model)
{
   // alert("testtesttest");
    return "what!";
}


function Destroy(id, model)
{
    
}

function HandleGrid(response, controller, profileId=-1)
{
    response = $.parseJSON(response);
    grid = '<table width="90%" class="table table-hover"><tbody>';

    console.log(response);


    $.each(response.data, function(index,item) 
    {   
        //TODO CLeanup!
        grid = grid + '<tr>' +
                '<td>' + item.name + '</td>' + 
                '<td>' + item.description + '</td>' +
                '<td>' + item.group_visibility + '</td>' +
               // + profileId == -1 ? '' : ('<td>' + '<button class="glyphicon glyphicon-edit btn-link" type="button" title="Profile"  onclick="Get(' + item.id + ', \'' + controller + '\')"></button>' + '</td>') +
                '</tr>';
    });

    grid = grid + '<button class="glyphicon glyphicon-user btn-plus" type="button" title="Create"  onclick=" document.getElementById("pageBody").load=\'..\\pages\\_form.html.erb\'"></button>&nbsp;'
    grid = grid + '</tbody></table>'

    

    return grid;
}


//POCOs
function Form(model)
{
    this.model = model;
    this.fields = new Array();

}

function FormField(bale, symbol, type)
{
    this.label = label;
    this.symbol = symbol;
    this.type = type;

}

function Section()
{
    this.title = title; 
    this.detail = detail;
    this.titleLink = title_link;
    this.detailLink = detail_link;
    this.blocks = new Array();    
    this.topButtons = new Array();    
    this.bottomButtons = new Array();
}

function Block()
{
    this.model = model;
    this.title = title; 
    this.detail = detail;
    this.title_link = title_link;
    this.detail_link = detail_link;
    this.topButtons = new Array();    
    this.bottomButtons = new Array();
}


function PageHeader()
{
    this.sections = new Array();
}

function PageBody()
{
    this.sections = new Array();
}


function PageFooter()
{
    this.sections = new Array();
}
