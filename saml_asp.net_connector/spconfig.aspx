<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/_header.master" CodeBehind="spconfig.aspx.cs" Inherits="miniOrange.spconfig" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">

    <style type="text/css">
        textarea {
            resize: none;
        }
    </style>

    <div class="heading">Configure Identity Provider</div>
    <div class="panel panel-default panel-height">
        <div runat="server" id="messageerror" style="margin: 25px 0px 10px 0px;"></div>
        <br />
        <div class="login-group test-config">
            <div class="row">
                <div class="col-md-3">
                    <a data-toggle="tooltip" data-placement="top" style="color: inherit; text-decoration: none;" title="" data-original-title="Service Provider Entity Id">
                        <p class="input_field_fonts"><span id="spentitys">SP Entity ID:<span style="color: red">*</span></span> &nbsp;<i class="glyphicon glyphicon-info-sign"></i></p>
                    </a>
                </div>
                <div class="col-md-5">

                    <label runat="server" class="form-control" id="sp_id"></label>

                </div>
            </div>
            <br />
            <div class="row">
                <div class="col-md-3">
                    <a data-toggle="tooltip" data-placement="top" style="color: inherit; text-decoration: none;" title="" data-original-title="AsseritonConsumerSecurity URL">
                        <p class="input_field_fonts"><span id="Acsurl">ACS URL<span style="color: red">*</span></span> &nbsp;<i class="glyphicon glyphicon-info-sign"></i></p>
                    </a>
                </div>
                <div class="col-md-5">
                    <label runat="server" class="form-control" id="acs"></label>
                </div>
            </div>
            <br />

            <div class="row">
                <div class="col-md-5 col-md-offset-3">
                    <asp:Button class="btn btn-primary btn-cnfrm col-md-2 margin-right" Font-Size="12px" ID="Submit" runat="server" Text="Save" OnClick="SP_Click" Width="50px" Height="32px" />
                    <asp:Button class="btn btn-primary btn-cnfrm col-md-2 margin-right" Font-Size="12px" ID="next_step" runat="server" Text="Next Step" OnClick="Next_Step" Width="80px" Height="32px" />

                </div>

            </div>
            <br />
            <br />
        </div>
    </div>
</asp:Content>
