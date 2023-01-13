import { LightningElement, api, wire } from 'lwc';
import findDocument from '@salesforce/apex/ShowDocumentController.getDocumentPublicURL';

export default class ImageController extends LightningElement {
    @api documentID;
    @api recordId;
    imageURL;
    // = 'https://anamedicaldr-dev-ed--c.documentforce.com/servlet/servlet.ImageServer?id=0157Q000000ckyZ&oid=00D7Q000001Mk55&lastMod=1653487764000';

    @wire(findDocument, { documentId: '$documentID' })
    wiredDocument  ({ error, data }) {
        if (typeof data != 'undefined') {
            this.imageURL = data;
        } else if (error) { 
           this.error = error;  
        }   
    }

}