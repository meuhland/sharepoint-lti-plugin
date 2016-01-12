﻿<%-- The following 4 lines are ASP.NET directives needed when using SharePoint components --%>

<%@ Page Inherits="Microsoft.SharePoint.WebPartPages.WebPartPage, Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" MasterPageFile="~masterurl/default.master" Language="C#" %>

<%@ Register TagPrefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>

<%-- The markup and script in the following Content element will be placed in the <head> of the page --%>
<asp:Content ContentPlaceHolderID="PlaceHolderAdditionalPageHead" runat="server">
    <script type="text/javascript" src="../Scripts/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="/_layouts/15/sp.runtime.js"></script>
    <script type="text/javascript" src="/_layouts/15/sp.js"></script>
    <script type="text/javascript" src="/_layouts/SP.RequestExecutor.js"></script>
    <meta name="WebPartPageExpansion" content="full" />

    <!-- Add your CSS styles to the following file -->
    <link rel="stylesheet"
        href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" />
    <link rel="stylesheet"
        href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css" />
    <link rel="stylesheet"
        href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css" />
    <link rel="Stylesheet" type="text/css" href="../Content/App.css" />

    <!-- Add your JavaScript to the following file -->
    <script type="text/javascript"
        src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="../Scripts/App.js"></script>

    <script type="text/javascript" src="../Scripts/custom/services/models.js"></script>
    <script type="text/javascript" src="../Scripts/angular.js"></script>
    <script type="text/javascript" src="../Scripts/custom/services/common-functions.js"></script>
    <script type="text/javascript" src="../Scripts/custom/services/global-app-list-manager.js"></script>
    <script type="text/javascript" src="../Scripts/custom/services/site-app-list-manager.js"></script>
    <script type="text/javascript" src="../Scripts/custom/services/user-permission.js"></script>
    <script type="text/javascript" src="../Scripts/custom/controllers/default-page-ctrl.js"></script>
</asp:Content>

<%-- The markup in the following Content element will be placed in the TitleArea of the page --%>
<asp:Content ContentPlaceHolderID="PlaceHolderPageTitleInTitleArea" runat="server">
</asp:Content>

<%-- The markup and script in the following Content element will be placed in the <body> of the page --%>
<asp:Content ContentPlaceHolderID="PlaceHolderMain" runat="server">

    <div style="margin-top: 25px;">
        <div ng-app="app">
            <div ng-controller="defaultPageCtrl">

                <div ng-show="vm.hasEditPermission" 
                     style="border-bottom:1px solid #E3E3E3;padding:0 0 5px 0">
                    <a id="lnkEditAppList"
                        href="{{vm.editPageUrl}}"
                        class="btn btn-warning"
                        style="text-shadow: none;">Edit App List &nbsp; <i class="fa fa-cog"></i>
                    </a>
                </div>

                <h5>Showing {{vm.appList.length}} Apps</h5>
               
                <div class="row row-eq-height">
                    <div class="col-md-2 col-sm-12 "
                        ng-if="vm.loadingData == false"
                        ng-repeat="eachApp in vm.appList">
                        <div style="width:95%;" class="appTile">
                            <a class="tileLink" href="{{vm.hostLtiPageUrl}}&appId={{eachApp.id}}">
                                <div class="text-center">
                                    <img src="{{eachApp.logoUrl}}" />
                                </div>
                                <div class="appName">
                                    {{eachApp.name}}
                                </div>
                                
                                <div class="appDescription">{{eachApp.description}}</div>
                            </a>
                        </div>

                    </div>

                </div>


            </div>
        </div>
    </div>

</asp:Content>
