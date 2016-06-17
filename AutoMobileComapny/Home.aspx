<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="AutoMobileComapny.Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="accordion">
        <h3>Section 1</h3>
        <div>
            <div class="accordion">
                <h3>brand1</h3>
                <div>
                    <div class="accordion">
                        <h3>Dealers</h3>
                        <div>
                            <div class="accordion">
                                <h3>Dealer 1</h3>
                                <div>zjkchkjzxc</div>
                                <h3>Dealer 2</h3>
                                <div>adsasd</div>
                                <h3>Dealer 3</h3>
                                <div>adsasd</div>
                                <h3>Dealer 4</h3>
                                <div>adsasd</div>
                            </div>
                        </div>
                        <h3>Models</h3>
                        <div>
                            <div class="accordion">
                                <h3>Model 1</h3>
                                <div>zjkchkjzxc</div>
                                <h3>Model 2</h3>
                                <div>adsasd</div>
                                <h3>Model 3</h3>
                                <div>adsasd</div>
                                <h3>Model 4</h3>
                                <div>adsasd</div>
                            </div>
                        </div>
                    </div>
                </div>
                <h3>brand1</h3>
                <div>sdfsdf</div>
                <h3>brand1</h3>
                <div>sdfsdf</div>
                <h3>brand1</h3>
                <div>sdfsdf</div>
            </div>
        </div>

        <%--     <h3>Section 1</h3>
        <div>
            <div class="accordion">
                <h3>brand1</h3>
                <div>sdfsdf</div>
                <h3>brand1</h3>
                <div>sdfsdf</div>
                <h3>brand1</h3>
                <div>sdfsdf</div>
                <h3>brand1</h3>
                <div>sdfsdf</div>
            </div>
        </div>
        
        <h3>Section 2</h3>
        <div>
            <p>
                Sed non urna. Donec et ante. Phasellus eu ligula. Vestibulum sit amet
purus. Vivamus hendrerit, dolor at aliquet laoreet, mauris turpis porttitor
velit, faucibus interdum tellus libero ac justo. Vivamus non quam. In
suscipit faucibus urna.
            </p>
        </div>

        <h3>Section 3</h3>
        <div>
            <p>
                Nam enim risus, molestie et, porta ac, aliquam ac, risus. Quisque lobortis.
Phasellus pellentesque purus in massa. Aenean in pede. Phasellus ac libero
ac tellus pellentesque semper. Sed ac felis. Sed commodo, magna quis
lacinia ornare, quam ante aliquam nisi, eu iaculis leo purus venenatis dui.
            </p>
            <ul>
                <li>List item one</li>
                <li>List item two</li>
                <li>List item three</li>
            </ul>
        </div>

        <h3>Section 4</h3>
        <div>
            <p>
                Cras dictum. Pellentesque habitant morbi tristique senectus et netus
et malesuada fames ac turpis egestas. Vestibulum ante ipsum primis in
faucibus orci luctus et ultrices posuere cubilia Curae; Aenean lacinia
mauris vel est.
            </p>
            <p>
                Suspendisse eu nisl. Nullam ut libero. Integer dignissim consequat lectus.
Class aptent taciti sociosqu ad litora torquent per conubia nostra, per
inceptos himenaeos.
            </p>
        </div>
        --%>
    </div>
    <script>
        $(function () {
            $(".accordion").accordion({
                header: "> h3:not(.item)",
                heightStyle: "content",
                active: false,
                collapsible: true
            });
        });

    </script>
</asp:Content>
