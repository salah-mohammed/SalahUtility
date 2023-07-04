//
//  ExamInfoViewController.swift
//  LMS
//
//  Created by SalahMohamed on 22/06/2023.
//  Copyright © 2023 t4edu. All rights reserved.
//

import UIKit
//examQuestionSource
//examAccessTypeTitle خاص بي فقط
//examCategory
//teacherFullName
class ExamInfoViewController: BaseAlertViewController {
    
    @IBOutlet weak var btnClose:UIButton!
    @IBOutlet weak var btnBottomClose:UIButton!
    @IBOutlet weak var lblExamTitle:UILabel!
    @IBOutlet weak var lblTeacherName:UILabel!
    @IBOutlet weak var lblExamRange:UILabel!
    @IBOutlet weak var lblExamCategory:UILabel!
    @IBOutlet weak var lblExamType:UILabel!
    @IBOutlet weak var lblPreparedBy:UILabel!
    @IBOutlet weak var lblDescription:UILabel!
    @IBOutlet weak var btnExamDetails:UIButton!

    var examObject:TExamObject?
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView();
        localized();
        setupData();
        fetchData();
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated);
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews();
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
    }
    @IBAction func btnClose(_ sender: Any) {
        self.dismiss(animated:true);
    }
    @IBAction func btnBottomClose(_ sender: Any) {
        self.dismiss(animated: true)
    }
    @IBAction func btnExamDetails(_ sender: Any) {
    self.dismiss(animated:true);
        if let examObject:TExamObject=self.examObject{
            QuestsTableViewController.navigateToQuestsTableViewShowDetails(selectedSubject:examObject,
                                                                           viewType:ExamViewControllerType.Exam,
                                                                           questions:examObject.questions)
        }
    }
}
// MARK: - Base Methods
extension ExamInfoViewController{
    func setupView(){
        
    }
    func localized(){
        
    }
    func setupData(){
        self.lblExamRange.text = self.examObject?.examAccessTypeTitle ?? ""
        self.lblTeacherName.text = self.examObject?.teacherFullName ?? ""
        self.lblExamTitle.text = self.examObject?.name ?? "";
        self.lblExamCategory.text = self.examObject?.e_examCategory?.s_title ?? ""
        self.lblPreparedBy.text = self.examObject?.s_examTypeTitle ?? "";
        self.lblExamType.text = self.examObject?.s_examQuestionSource ?? "";
        self.lblDescription.text = "adsadsadsadasdsadsadsadsadasdsadasdasadsadsadsadasdsadasdasadsadsadsadasdsadasdasadsadsadsadasdsadasdasadsadsadsadasdsadasdasadsadsadsadasdsadasdasadsadsadsadasdsadasdasadsadsadsadasdsadasdasadsadsadsadasdsadasdasadsadsadsadasdsadasdasadsadsadsadasdsadasdasadsadsadsadasdsadasdasadsadsadsadasdsadasdasadsadsadsadasdsadasdasadsadsadsadasdsadasdasadsadsadsadasdsadasdasadsadsadsadasdsadasdasadsadsadsadasdsadasdasadsadsadsadasdsadasdasadsadsadsadasdsadasdasadsadsadsadasdsadasdasadsadsadsadasdsadasdasadsadsadsadasdsadasdasadsadsadsadasdsadasdasadsadsadsadasdsadasdasadsadsadsadasdsadasdasadsadsadsadasdsadasdasadsadsadsadasdsadasdasadsadsadsadasdsadasdasadsadsadsadasdsadasdasadsadsadsadasdsadasdasadasdas v"//self.examObject?.s_description ?? "";
    }
    func fetchData(){
        
    }
}
// MARK: - Networking Methods
extension ExamInfoViewController{
    
}

extension ExamInfoViewController{
    static func present(_ object:TExamObject){
        let vc = ExamInfoViewController.init(nibName:"ExamInfoViewController", bundle:nil);
        vc.examObject = object;
        AppDelegate.sharedInstance?.rootNavigationController?.present(vc, animated: true);
    }
}
