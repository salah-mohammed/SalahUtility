//
//  HTMLTestViewController.swift
//  TestApp3
//
//  Created by Salah on 10/6/22.
//

import UIKit

extension String{
    public func bs_stripHTML() -> String {
        var tempString = self;
        tempString = tempString.replacingOccurrences(of: "&ndash;", with: "-")
        tempString = tempString.replacingOccurrences(of: "&nbsp;", with: " ")
        return tempString.replacingOccurrences(of: "<[^>]+>", with: "", options: String.CompareOptions.regularExpression, range: nil)
    }
}
class HTMLTestViewController: UIViewController {
    @IBOutlet weak var lblTitle:UILabel!
    @IBOutlet weak var lblDetails:UITextView!
    var html1:(String,String) = ("#1","""
<p>
    &nbsp;</p>
<p>
    <section class="copyrighted">
    <p>
        The Entrepreneurs listed on our Website are private companies. When considering investing in private companies, you must take into account the following risks:</p>
    <p>
        <strong>Your investment may lose value -</strong> The Entrepreneurs that you may invest in through our Website are private start-up, early-stage or small to medium sized companies that are looking to launch a product or service and may not have a proven track record.</p>
    <p>
        <strong>Your investments are illiquid &ndash; </strong>By definition, there is no public market for private companies and there may never be a market for the shares in the Entrepreneurs in which you decide to invest. Accordingly, you may not be able to sell these shares or realize any profit (even a return of capital) from any investment that you make.</p>
    <p>
        <strong>Private companies are not required to report on their financial status like public companies &ndash; </strong>While the Entrepreneurs that list on our Website will commit to us to regularly update shareholders regarding their performance through our Website, there is no guarantee that they will adhere to this commitment and we do not guarantee that we will take action against them if they fail to so adhere.</p>
    <p>
        <strong>Private companies are not subject to the same regulatory requirements as a public company - </strong>When a company goes public they are required to disclose specific information and adhere to strict regulations with regard to their actions, disclosure and corporate governance. The Entrepreneurs listed on our Website are not subject to the same requirements.</p>
    <p>
        <strong>Voting rights and other Pitch terms &ndash; </strong>You should read the terms of any Pitch carefully in order to understand what rights are being granted by the Entrepreneurs in which you choose to invest. In the majority of cases, the number of shares being offered by Entrepreneurs will not reach the threshold required to allow such shares to influence any decisions or corporate actions taken by the Entrepreneurs. Entrepreneurs may not offer any minority shareholder rights (such as tag along, drag along, veto rights or anti-dilution rights) and even if they do offer such rights, there is no guarantee that these rights are legally enforceable or that you will have any recourse against the Entrepreneur in the event that they fail to honor any of the rights granted. While Eureeca will make every effort to ensure that Entrepreneurs adhere to the Pitch terms following Closing of any Pitch, Eureeca will not be liable to you for any failure by the Entrepreneur to do so.</p>
    <p>
        <strong>Disclosure in the Pitch &ndash; </strong>A well prepared Pitch will describe the various risks and conflicts of interest relating to the Entrepreneur, the Pitch and the Entrepreneur&rsquo;s operations and we will guide the Entrepreneurs to assist them in preparing full and fair disclosure of all risks in their Pitch. However, we have no ability to assess whether all such risks have been accurately described or disclosed and will not have any responsibility for any failure to do so. Before making any investment decisions, you should fully assess the risks attached to any investment and should query any matters where you feel inadequate risk disclosure has been made.</p>
    <p class="hide">
        <strong>Business Failure Rates &ndash;&nbsp;</strong> You may assess the actual and expected failure rates of businesses on the platform by clicking <a href="/Static/BusinessFailureRates.aspx">here</a>.</p>
    <div class="hide">
        <p>
            <strong>Complaints Process &ndash;&nbsp;</strong>If a client has any complaints or queries about the services provided by Eureeca or in relation to the Eureeca Platform, they should contact us on <a href="mailto:contactus@eureeca.com">contactus@eureeca.com</a></p>
        <p>
            A complaint must include:</p>
        <p>
            (i) the Client&rsquo;s name and surname</p>
        <p>
            (ii) the Client&rsquo;s User ID</p>
        <p>
            (iii) the affected transaction number(s), if applicable</p>
        <p>
            (iv) the date and time that the issue arose, and</p>
        <p>
            (v) an accurate description of the issue.</p>
        <p>
            Upon receiving information about the complaint, Eureeca will write to the complainant to acknowledge that the complaint has been recorded and is receiving the firm&rsquo;s attention within 48 hours of receipt of being notified of the complaint.</p>
        <p>
            Eureeca will nominate a person who is not directly involved in the matter to carry out an investigation (the complaint officer).</p>
        <p>
            Within 30 days of the complaint, Eureeca shall write to the complainant to explain the firm&rsquo;s views on the matter and the action, if any, it proposes to take.</p>
        <p>
            Eureeca will record all relevant details of the complaint in the firm&rsquo;s complaints register for internal record purposes.</p>
        <p>
            If the complaint cannot be resolved within 30 days, the complainant should be provided with a progress report which includes details as to why the complaint has not been resolved and when the complainant can expect a resolution.</p>
    </div>
    <p>
        Keep in mind that the past performance of any investment is not necessarily indicative of future results. You should only commit money that you can afford to lose to any investment on our website. Private company investments are not for everyone and entail risks that are different from more traditional investments. You should obtain investment and tax advice from your advisers before deciding to invest. Eureeca does not provide any investment, legal or tax advice and will not have any liability for any legal, investment or tax issues in connection with any investment you decide to make.</p>
    </section></p> 
""")
    var html2 = ("#2","""
<a href="https://www.nestle-mena.com/en/media/pressreleases/allpressreleases/nestle-purina-petcare-unleashed-2021-program">Lebanon’s PawPots Winner of Nestlé Purina PetCare’s UNLEASHED 2021 Accelerator Lab Program</a>

<br>

<a href="https://euagenda.eu/news/573914">EBRD Star Venture programme winner announcement</a>

<br>

<a href="https://www.zawya.com/en/business/lebanons-pawpots-winner-of-nestl-purina-petcares-unleashed-2021-q9sw8adk">PawPots winner of Nestlé Purina PetCares Unleashed 2021</a>

<br>

<a href="https://www.youtube.com/watch?v=K99KxKx41Zo"> Jad Karam @MTV ALIVE - Nutrition tips for pet parents! </a>

<br>

<a href="https://www.youtube.com/watch?v=qudQnIZZ15o"> Made in Lebanon - 11/06/2022 - Jad Karam - PAWPOTS </a> 

""")
    var html3 = ("#3","""
EAT Serves Best Shawarma in Toronto: <br><br>

<a href="https://www.youtube.com/watch?v=tEHBEKve09o" target="_blank">Watch  Here!</a>
<br><br>

Toronto Life Magazine: EAT launches new downtown casual spot:<br><br>

 <p><a href="https://torontolife.com/food/whats-on-the-menu-at-azkadenya-a-new-downtown-fast-casual-spot-for-mezze-and-tableside-shawarma/">Read Article!</a></p>
<br>
MENA FN: Abdali Mall and EAT Sign an Agreement to Open Four Restaurants: <br><br>
<p><a href="https://menafn.com/qn_news_story_s.aspx?storyid=1095168700&title=Abdali-Mall-and-EAT-Restaurants-Group-Sign-an-Agreement-to-Open-Four-Restaurants">Read Article!</a></p>
<br>

QSR Magazine: Franklin Junction Partners with EAT to Target Development in MENA:<br><br>
<a href="https://www.qsrmagazine.com/news/franklin-junction-partners-food-conglomerate-eat-target-development-middle-east-and-north" target="_blank">Read Article!</a>
<br><br>
Living in Jordan as Expat: Blog on LHM: <br><br>
<a href="https://livinginjordanasexpat.com/2019/08/25/lhm-all-about-meat/?fbclid=IwAR3np0HNEzrGbFLrTxZLh2O5DPgrAyGLj-yWVoj-SDsGwxp75B8LIL9HkNM" target="_blank">Read Article!</a>
<br><br>

Umami Opening in 2012: First Asian Fusion Experiences Concept in Jordan: <br><br>
<a href="https://www.youtube.com/watch?v=kk7ItaUFJcE" target="_blank">Watch Here!</a>  

""")
    var html4 = ("#4","""
<B>WE'VE WORKED WITH THESE BRANDS</B>
<br>
<br>
<img src="https://i.imgur.com/OaQLm6z.jpeg">
""")
    override func viewDidLoad() {
        super.viewDidLoad()
        var html = html4;
        self.lblTitle.text="Sample \(html.0)"
        self.lblDetails.text=html.1.bs_stripHTML();

        // Do any additional setup after loading the view.
    }


}

