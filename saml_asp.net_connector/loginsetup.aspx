<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/_header.master" CodeBehind="loginsetup.aspx.cs" Inherits="miniOrange.loginsetup" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
    <style type="text/css">
        textarea {
            resize: none;
        }
    </style>

    <div class="heading">Login Settings</div>
    <div class="panel panel-default panel-height">
        <div class="panel-heading heading_font">
            <h4>Configuration Page</h4>
        </div>
        <div runat="server" id="messageerror" style="margin: 25px 0px 10px 0px;"></div>
        <div class="login-group test-config">
            <br />
            <div class="row">
                <div class="col-md-3">
                    <a data-toggle="tooltip" data-placement="top" style="color: inherit; text-decoration: none;" title="" data-original-title="Connection string for the . eg: https://<idp url>/moas">
                        <p class="input_field_fonts"><span id="endpointurl">Endpoint Url:<span style="color: red">*</span></span> &nbsp;<i class="glyphicon glyphicon-info-sign"></i></p>
                    </a>
                </div>
                <div class="col-md-5">
                    <textarea class="form-control" style="height: 40px;" required="required" id="urlid" placeholder="Please Insert Application Login Url" runat="server"></textarea>
                </div>
            </div>
            <br />
            <div class="row">
                <div class="col-md-3">
                    <a data-toggle="tooltip" data-placement="top" style="color: inherit; text-decoration: none;" title="" data-original-title="IdP Single Sign-On Url">
                        <p class="input_field_fonts"><span id="encryptionkeys">Encryption Key<span style="color: #c1bdbd">[16 Character]</span>:<span style="color: red">*</span></span> &nbsp;<i class="glyphicon glyphicon-info-sign"></i></p>
                    </a>
                </div>
                <div class="col-md-5">

                    <textarea class="form-control" style="height: 40px;" runat="server" required="required" id="ecryptionkey" placeholder="Please Enter Your Encryption Key"></textarea>
                </div>
            </div>
            <br />

            <div class="row">
                <div class="col-md-5 col-md-offset-3">

                    <asp:Button Class="btn btn-primary btn-cnfrm col-md-2 margin-right" ID="Save" runat="server" Font-Size="12px" Text="Save" OnClick="save" Width="80px" Height="32px" />

                </div>

            </div>
            <br />
            <br />
        </div>
    </div>
</asp:Content>
