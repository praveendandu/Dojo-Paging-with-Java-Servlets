<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <title>Paging Example by Prateep Gedupudi</title>

        <link rel="stylesheet" href="http://o.aolcdn.com/dojo/1.1/dojox/grid/_grid/Grid.css">
        <link rel="stylesheet" href="http://o.aolcdn.com/dojo/1.1/dojox/grid/_grid/tundraGrid.css">
        <link rel="stylesheet" href="http://o.aolcdn.com/dojo/1.1/dijit/themes/tundra/tundra.css">
        <link rel="stylesheet" href="http://o.aolcdn.com/dojo/1.1/dojo/resources/dojo.css">

        <script
            type="text/javascript"
            src="http://o.aolcdn.com/dojo/1.1/dojo/dojo.xd.js"
            djConfig="parseOnLoad:true"
        ></script>

        <script type="text/javascript">
            dojo.require("dojox.data.QueryReadStore");
            dojo.require("dojox.grid.Grid");
            dojo.require("dojo.parser");

            // some functions to format grid cell data
            computeTotal = function(rowIndex) {
                row = model.getRow(rowIndex);
                return row ? "$"+row.cost*row.quantity : "";
            }
            formatCost = function(rowIndex) {
                row = model.getRow(rowIndex);
                return row ? "$"+row.cost : "";
            }

            // a simple grid layout that consists of 5 columns
            layout = [
                {cells:[[
                    {name:'ID',field:'id',width:'5'},
                    {name:'Item',field:'item',width:'auto'},
                    {name:'Quantity',field:'quantity', width:5},
                    {name:'Cost',field:'cost', width: 5, get: formatCost},
                    {name:'Total',field:'total', width: 5, get : computeTotal}
                ]]}
            ];

        </script>
    <head>
    <body class="tundra">

        <!-- The dojo.data API implementation that talks to the server -->
        <div dojoType="dojox.data.QueryReadStore" jsId="store", url="/DojoProject/data"></div>

        <!-- The intermediary between the dojo.data API and the grid -->
        <div dojoType="dojox.grid.data.DojoData" jsId="model" rowsPerPage="20" store="store">  

        <!-- The grid, which relies on its DojoData abstraction for info -->
        <div style="height:300px; width:400px;" dojoType="dojox.grid.Grid" model="model" structure="layout" delayScroll="true"></div>
        
        

    </body>
</html>