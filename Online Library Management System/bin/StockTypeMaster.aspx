<%@ Page Language="C#" MasterPageFile="~/UserMaster.Master" AutoEventWireup="true" CodeBehind="StockTypeMaster.aspx.cs" Inherits="Online_Library_Management_System.StockTypeMaster" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Panel ID="Panel3" runat="server" Height="486px" CssClass="PanelAll">
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <br />
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <table class="TableControlMid" >
                    <tr>
                        <td class="TableHeader" colspan="3" >
                            Stock Type Master</td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblstkid" runat="server" Font-Names="Comic Sans MS" 
                                Text="Stock Type ID"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtstkid" runat="server" ReadOnly="True"></asp:TextBox>
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td >
                            <asp:Label ID="lblstknm" runat="server" Font-Names="Comic Sans MS" 
                                Text="Stock Name"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtstknm" runat="server" MaxLength="10"></asp:TextBox>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                ControlToValidate="txtstknm" CssClass="ValidationControl" 
                                EnableViewState="False" ErrorMessage="Enter Stock Name" SetFocusOnError="True"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td >
                            &nbsp;</td>
                        <td>
                            <asp:Button ID="btninsert" runat="server" Font-Bold="True" 
                                Font-Names="Comic Sans MS" onclick="btninsert_Click" Text="Insert" 
                                CausesValidation="False" />
                            &nbsp;&nbsp;
                            <asp:Button ID="btnsave" runat="server" Enabled="False" Font-Bold="True" 
                                Height="27px" onclick="btnsave_Click" Text="Save" Width="56px" />
                            &nbsp;
                            <asp:Button ID="btncancle" runat="server" Font-Bold="True" 
                                Font-Names="Comic Sans MS" Text="Cancel" onclick="btncancle_Click" 
                                CausesValidation="False" />
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;</td>
                        <td>
                            <asp:Label ID="lblerr" runat="server" ForeColor="#FF3300" Visible="False"></asp:Label>
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td colspan="3">
                            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                                CellPadding="4" CssClass="GridView" ForeColor="#333333" GridLines="None" 
                                onrowcommand="GridView1_RowCommand">
                                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                <RowStyle BackColor="#EFF3FB" />
                                <Columns>
                                    <asp:TemplateField HeaderText="Stock Type ID">
                                        <AlternatingItemTemplate>
                                            <asp:Label ID="lblstkid" runat="server" Text='<%# Eval("intStock_Type_ID") %>'></asp:Label>
                                        </AlternatingItemTemplate>
                                        <EditItemTemplate>
                                            <asp:Label ID="lblstkid" runat="server" Text='<%# Eval("intStock_Type_ID") %>'></asp:Label>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="lblstkid" runat="server" Text='<%# Eval("intStock_Type_ID") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" />
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Stock Name">
                                        <AlternatingItemTemplate>
                                            <asp:Label ID="lblstknm" runat="server" Text='<%# Eval("strStock_Name") %>'></asp:Label>
                                        </AlternatingItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtstknm" runat="server" Text='<%# Eval("strStock_Name") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="lblstknm" runat="server" Text='<%# Eval("strStock_Name") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" />
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Action">
                                        <AlternatingItemTemplate>
                                            <asp:LinkButton ID="lnkedit" runat="server" 
                                                CommandArgument='<%# Eval("intStock_Type_ID") %>' CommandName="EditStock" 
                                                CausesValidation="False">Edit</asp:LinkButton>
                                        </AlternatingItemTemplate>
                                        <EditItemTemplate>
                                            <asp:LinkButton ID="lnkedit0" runat="server" 
                                                CommandArgument='<%# Eval("intStock_Type_ID") %>' CommandName="EditRack" 
                                                CausesValidation="False">Edit</asp:LinkButton>
                                            &nbsp;&nbsp;
                                            <asp:LinkButton ID="lnkupdate" runat="server" 
                                                CommandArgument='<%# Eval("intStock_Type_ID") %>' 
                                                CommandName="UpdateStock" CausesValidation="False">Update</asp:LinkButton>
                                            &nbsp;&nbsp;
                                            <asp:LinkButton ID="LinkButton1" runat="server" 
                                                CommandArgument='<%# Eval("intStock_Type_ID") %>' 
                                                CommandName="CancelStock" CausesValidation="False">Cancel</asp:LinkButton>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:LinkButton ID="lnkedit1" runat="server" 
                                                CommandArgument='<%# Eval("intStock_Type_ID") %>' CommandName="EditStock" 
                                                CausesValidation="False">Edit</asp:LinkButton>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" />
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:TemplateField>
                                </Columns>
                                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                <HeaderStyle BackColor="#0099CC" Font-Bold="True" ForeColor="White" />
                                <EditRowStyle BackColor="#66CCFF" />
                                <AlternatingRowStyle BackColor="White" />
                            </asp:GridView>
                        </td>
                    </tr>
                </table>
            </ContentTemplate>
        </asp:UpdatePanel>
        <br />
    </asp:Panel>
</asp:Content>
