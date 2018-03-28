
import UIKit
import CoreData

class ActiviteTypeViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
 
    @IBOutlet weak var picker: UIPickerView!
    
    let segueShowNomActivite = "showNomActiviteSegue"
     var typesactivite : [TypeActivite] = []
     var activitePasse = TypeActivite() 
    
    
    @IBOutlet weak var buttonChoisirJour: UIButton!
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == segueShowNomActivite {
            let alarmActivite = segue.destination as! ActiviteJoursViewController
            alarmActivite.nomActivite = activitePasse
        }
    
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        picker.dataSource = self
        picker.delegate = self
        listeTypeActivite()
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    /**
     retourne lel nombre de components
     */
   func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    /**
   The number of columns of data
     */
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    /**
     retourne nombre de lignes de data
     */
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return typesactivite.count
    }
    /**
    The data to return for the row and component (column) that's being passed in
     */
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return typesactivite[row].libelleTypeActivite
    }
    
    /**
     permet d'avoir l'activité que l'utilisateur à choisi dans le pickerView
     */
    func pickerView( _ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)  {
        if ( typesactivite.count != 0){
            activitePasse = typesactivite[row]
        }
        
    }
    
/**
     retourne la lise des type d'activité existante dans la variable typesactivite
     change les attributs de classes activitePasse  et typesactivite
 ## Important Notes ##
  si l'utilisateur n'emmet pas de choix, un pop up sort pour empêcher d'aller à la page suivante

 */
    
    func listeTypeActivite(){
        let daoF = CoreDataDAOFactory.getInstance()
        let typeActiviteDAO = daoF.getTypeActiviteDAO()

        do{
            try self.typesactivite = typeActiviteDAO.getAll()!
            if  self.typesactivite.isEmpty == false {
               self.activitePasse = self.typesactivite[0]
            }else{
                let alert = UIAlertController(title: "Oh oh!", message:"Veuillez ajouter un type d'activité", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default) { _ in })
                self.present(alert, animated: true){}
                self.buttonChoisirJour.isEnabled = false
            }
            
        }catch{
            
        }
    }
    
}

