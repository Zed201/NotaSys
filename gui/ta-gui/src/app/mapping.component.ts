import { Component, Input, OnInit, Output, EventEmitter } from '@angular/core';
import { Http, Headers } from '@angular/http';

@Component({
  selector: 'app-mapping',
  templateUrl: './mapping.component.html'
})
export class MappingComponent {

  @Input() columns: string[] = [];
  @Input() selectedFile: File | null = null; // aqui recebe o arquivo
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
    
    const formD = new FormData();
    formD.append('file', this.selectedFile);
    formD.append('mapping', JSON.stringify(this.mapping))
    console.log(this.mapping)

    this.http.post('http://localhost:3000/metas', formD).subscribe(() => {
      alert('Enviado!');
      this.onComplete.emit(); // opcional
    });
  }
}
