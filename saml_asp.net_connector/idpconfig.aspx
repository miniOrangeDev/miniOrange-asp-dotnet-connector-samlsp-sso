<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="_header.master" CodeBehind="idpconfig.aspx.cs" Inherits="miniOrange.idpconfig" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">

    <link href="~/Content/style.css" rel="stylesheet" />
    <link href="Content/login.css" rel="stylesheet" />
    <link href="Content/admin_style.css" rel="stylesheet" />
    <link href="~/Content/bootstrap-3.3.6-dist/css/bootstrap.min.css" rel="stylesheet" />
    <script src="~/Content/bootstrap-3.3.6-dist/css/bootstrap.css"></script>
    <script src="~/Content/bootstrap-3.3.6-dist/js/bootstrap.js"></script>
    <style>
        textarea {
            resize: none;
        }
    </style>
    <div class="heading">Configure Service Provider</div>
    <div class="panel panel-default panel-height">
        <div runat="server" id="messageerror" style="margin: 25px 0px 10px 0px;">
        </div>
        <div class="login-group test-config">
            <div class="row">
                <div class="col-md-3">
                    <a data-toggle="tooltip" data-placement="top" style="color: inherit; text-decoration: none;" title="" data-original-title="Connection string for the . eg: https://<idp url>/moas">
                        <p class="input_field_fonts"><span id="idpentitys">IdP Entity ID:<span style="color: red">*</span></span> &nbsp;<i class="glyphicon glyphicon-info-sign"></i></p>
                    </a>
                </div>
                <div class="col-md-5">
                    <textarea class="form-control" style="height: 40px;" required="required" id="idpentity" placeholder="Identity Provider Entity Id or Issuer" runat="server"></textarea>
                </div>
            </div>
            <br />
            <div class="row">
                <div class="col-md-3">
                    <a data-toggle="tooltip" data-placement="top" style="color: inherit; text-decoration: none;" title="" data-original-title="IdP Single Sign-On Url">
                        <p class="input_field_fonts"><span id="sso_urls">Single SignOn URL:<span style="color: red">*</span></span> &nbsp;<i class="glyphicon glyphicon-info-sign"></i></p>
                    </a>
                </div>
                <div class="col-md-5">

                    <textarea class="form-control" style="height: 40px;" runat="server" required="required" placeholder="Singl Sign On Service URL of your IdP" id="sso_url"></textarea>
                </div>
            </div>
            <br />

            <div class="row">
                <div class="col-md-3">
                    <a data-toggle="tooltip" data-placement="top" style="color: inherit; text-decoration: none;" title="" data-original-title="SP Certificate generated in your IdP">
                        <p class="input_field_fonts"><span id="">X.509 Certificate:<span style="color: red">*</span></span> &nbsp;<i class="glyphicon glyphicon-info-sign"></i></p>
                    </a>
                </div>
                <div class="col-md-5">

                    <textarea class="form-control" style="height: 200px;" runat="server" required="required" placeholder="Copy and Paste content of downloaded X.509certificate" id="idpcertificate"></textarea>
                    <b style="font-size: 12px;">
                    <br />
                    NOTE:</b>" Format of the certificate:"<br />
                    <b style="font-size: 12px;">-----BEGIN CERTIFICATE-----<br />
                        XXXXXXXXXXXXXXXXXXXXXXXXX<br />
                        -----END CERTIFICATE-----</b>
                    <br />
                    <br />
                </div>
            </div>

            <br />
            <div class="row">
                <div class="col-md-5 col-md-offset-3">
                    <asp:Button class="btn btn-primary btn-cnfrm col-md-2 margin-right" ID="Button1" runat="server" Text="Save" Font-Size="12px" OnClick="IDP" Width="50px" Height="32px" />
                    <asp:Button class="btn btn-primary btn-cnfrm col-md-2 margin-right" ID="Test" runat="server" Text="Test Configuration" Font-Size="12px" OnClick="TestConfig" Width="150px" Height="32px" />
                </div>

            </div>
            <br />
            <br />
        </div>
    </div>
</asp:Content>
