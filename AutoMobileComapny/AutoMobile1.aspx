<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="AutoMobile1.aspx.cs" Inherits="AutoMobileComapny.AutoMobile1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script>
        var CompanyData,
            BrandData,
            ModelData,
            DealerData,
            CustomerData;

        $(function () {
            $.ajax({
                type: "POST",
                url: "AutoMobile1.aspx/GetCompany",
                data: "{'companyId':''}",
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    CompanyData = $.parseJSON(data.d).CompanyList;
                }
            });

            $.ajax({
                type: "POST",
                url: "AutoMobile1.aspx/GetBrand",
                data: "{'companyId':''}",
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    BrandData = $.parseJSON(data.d).BrandList;
                }
            });

            $.ajax({
                type: "POST",
                url: "AutoMobile1.aspx/GetModel",
                data: "{'companyId':''}",
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    ModelData = $.parseJSON(data.d).ModelList;
                }
            });

            $.ajax({
                type: "POST",
                url: "AutoMobile1.aspx/GetDealer",
                data: "{'companyId':''}",
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    DealerData = $.parseJSON(data.d).DealerList;
                }
            });

            var delay = 2000;
            setTimeout(function () {
                FrameData();
            }, delay);

        });

        var html = "";
        function FrameData() {
            var companyId = 0, brands;
            var brandId = 0, models, dealers;
            for (var j = 0; j < CompanyData.length; j++) {
                html += "<h3><b>" + CompanyData[j].CompanyName + "</b></h3>";
                html += "<div>";
                html += "<div class='accordion'>";
                companyId = CompanyData[j].CompanyId;
                brands = BrandData.filter(function (el) {
                    return el.CompanyId == companyId;
                });

                for (var k = 0; k < brands.length; k++) {
                    html += "<h3><b>" + brands[k].BrandName + "</b></h3>";
                    html += "<div>";
                    html += "<div class='accordion'>";
                    brandId = brands[k].BrandId;

                    html += "<h3><b>Dealers</b></h3>";
                    html += "<div>";
                    html += "<div class='accordion'>";
                    dealers = DealerData.filter(function (el) {
                        return el.BrandId == brandId;
                    });

                    for (var l = 0; l < dealers.length; l++) {
                        html += "<h3><b>" + dealers[l].DealerName + "</b></h3>";
                        html += "<div><b>Location:</b> " + dealers[l].Location + "</div>";
                    }
                    html += "</div>";
                    html += "</div>";

                    html += "<h3><b>Models</b></h3>";
                    html += "<div>";
                    html += "<div class='accordion'>";
                    models = ModelData.filter(function (el) {
                        return el.BrandId == brandId;
                    });
                    for (var i = 0; i < models.length; i++) {
                        html += "<h3><b>" + models[i].ModelName + "</b></h3>";
                        html += "<div><b>VehicleType:</b> " + models[i].VehicleType + "<br/><b> Price: </b>$" + models[i].Price + ".00</div>";
                    }
                    html += "</div>";
                    html += "</div>";

                    html += "</div>";
                    html += "</div>";
                }

                html += "</div>";
                html += "</div>";
            }

            $("#Company").html(html);
            BindAccordian();
        }

        function BindAccordian() {
            $(".accordion").accordion({
                header: "> h3:not(.item)",
                heightStyle: "content",
                active: false,
                collapsible: true
            });
        }
    </script>

    <div id="Company" style="margin: 5px;" class="accordion">
    </div>

    
</asp:Content>
