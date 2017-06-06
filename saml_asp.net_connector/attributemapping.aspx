<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="_header.master" CodeBehind="attributemapping.aspx.cs" Inherits="miniOrange.attributemapping" %>

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


    <div class="heading">Attibute Mapping</div>
    <div class="panel panel-default panel-height">
        <div runat="server" id="messageerror" style="margin: 25px 0px 10px 0px;">
        </div>
        <div class="login-group test-config">
            <br />
            <div class="row">
                <div class="col-md-3">
                    <a data-toggle="tooltip" data-placement="top" style="color: inherit; text-decoration: none;" title="" data-original-title="Name Attibute which recieved during Test Configuration">
                        <p class="input_field_fonts"><span id="nameid">Username:<span style="color: red">*</span></span> &nbsp;<i class="glyphicon glyphicon-info-sign"></i></p>
                    </a>
                </div>
                <div class="col-md-5">
                    <textarea class="form-control" style="height: 40px;" required="required" placeholder="NameID" id="Name_ID" runat="server"></textarea>
                </div>
            </div>
            <br />

            <div class="row">
                <div class="col-md-5 col-md-offset-3">
                    <asp:Button class="btn btn-primary btn-cnfrm col-md-2 margin-right" ID="sub" OnClick="Attr" runat="server" Text="Save" Font-Size="12px" Width="80px" Height="32px" />
                    <asp:Button class="btn btn-primary btn-cnfrm col-md-2 margin-right" Font-Size="12px" ID="step" runat="server" Text="Next Step" OnClick="Next_Step" Width="80px" Height="32px" />
                </div>

            </div>
            <br />
            <br />
        </div>
    </div>
</asp:Content>
