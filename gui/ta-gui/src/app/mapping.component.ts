import { Component, Input, OnInit, Output, EventEmitter } from '@angular/core';
import { Http, Headers } from '@angular/http';

@Component({
  selector: 'app-mapping',
  templateUrl: './mapping.component.html'
})
export class MappingComponent {

  @Input() columns: string[] = [];
  @Input() fileContent: any;
  @Input() fileName: string = '';

  @Output() onComplete = new EventEmitter<void>(); // opcional, para avisar que enviou

  mapping: any = {};
  TARGET_FIELDS = ['nome', 'sobrenome', 'idade', 'email'];

  constructor(private http: Http) {}

  ngOnInit() {
    this.columns.forEach(c => this.mapping[c] = '');
  }

  sendToBackend() {
    const payload = {
      mapping: this.mapping,
      fileName: this.fileName
    };

    this.http.post('/api/import', payload).subscribe(() => {
      alert('Enviado!');
      this.onComplete.emit(); // opcional
    });
  }
}
