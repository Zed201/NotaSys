import { Component } from '@angular/core';
import * as Papa from 'papaparse';
import * as XLSX from 'xlsx';
import { Router } from '@angular/router';

@Component({
  selector: 'app-upload',
  templateUrl: './upload.component.html'
})
export class UploadComponent {

  selectedFile: File | null = null;
  columns: string[] = [];
  
  step: number = 1; // controla qual “página” está visível

  constructor(private router: Router) {}

  onFileSelected(event: any) {
    // this.file = event.target.files[0] ?? null;
    if (event.target.files && event.target.files.length > 0) {
          this.selectedFile = event.target.files[0];
        } else {
          this.selectedFile = null;
        }
  }

  processFile() {
    if (!this.selectedFile) return;

    const reader = new FileReader();
    // const ext = this.file.name.split('.').pop()?.toLowerCase();
    const parts = this.selectedFile.name.split('.');
        const ext = parts.length > 1 ? parts[parts.length - 1].toLowerCase() : '';
        
    reader.onload = (e: any) => {
      const data = e.target.result;

      if (ext === 'csv') {
        const parsed = Papa.parse(data, { header: true });
        this.columns = parsed.meta.fields || [];

      } else if (ext === 'xls' || ext === 'xlsx') {
        const workbook = XLSX.read(data, { type: 'binary' });
        const sheetName = workbook.SheetNames[0];
        const sheet = XLSX.utils.sheet_to_json(workbook.Sheets[sheetName], { header: 1 });

        this.columns = sheet[0] as string[];      // primeira linha = cabeçalhos
      }

      // vai para a tela de mapeamento
      this.step = 2; // mostrar MappingComponent
      
    };
    
    if (ext === 'csv') {
      reader.readAsText(this.selectedFile);
    } else {
      reader.readAsBinaryString(this.selectedFile);
    }
  }
  previousStep() {
     if (this.step > 1) this.step--;
   }
}
