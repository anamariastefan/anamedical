import { LightningElement, wire, api, track } from 'lwc';
import findAddress from '@salesforce/apex/ShowMapController.getAddressInfo';

export default class LightningMapExample extends LightningElement {
    @api recordId;
    @track address;

    @wire(findAddress, { recordId: '$recordId' })
    wiredAddress  ({ error, data }) {
        if (typeof data != 'undefined') {
            this.address = data;
        } else if (error) { 
           this.error = error;  
        }   
    }

    get addressMarkers() {
        if(typeof this.address != 'undefined')
            return [
                {
                    location: {
                        City: this.address.City,
                        Country: this.address.Country,
                        State: this.address.State,
                        Street: this.address.Street,
                    },
                    value: this.address.Id,
                    title: this.address.Name,
                },
            ];
    }
}