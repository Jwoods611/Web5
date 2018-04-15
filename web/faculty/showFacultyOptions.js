/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


$(document).ready(function () {
    $("#uploadGrades").hide();
    $("#rcuploadGrades").click(function () {
        $("#viewRedCards").hide();
        $("#uploadGrades").slideToggle("slow");
    });
});

$(document).ready(function () {
    $("#viewRedCards").hide();
    $("#rcviewRedCards").click(function () {
        $("#uploadGrades").hide();
        $("#viewRedCards").slideToggle("slow");
    });
});