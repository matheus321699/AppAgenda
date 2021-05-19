package appAgenda;

import java.util.Calendar;
import java.util.GregorianCalendar;

public class Contato extends ContatoBasico{
	
	protected Calendar dtnasc;
	
	Contato(String nome, Calendar dtnasc)
	{
		super(nome);
		this.dtnasc = dtnasc;
	}	


	
	public String getDados() {
		return super.getDados() + "Nascido em " +
		dtnasc.get(Calendar.DATE) + "/" +
		dtnasc.get(Calendar.MONTH) + "/" +
		dtnasc.get(Calendar.YEAR) + "\nIdade: ";
	
	
	}
	
	
	
	public int getIdade(){
		Calendar hoje = new GregorianCalendar();
		int idade = hoje.get(Calendar.YEAR)-dtnasc.get(Calendar.YEAR);
		hoje.set(Calendar.YEAR, dtnasc.get(Calendar.DAY_OF_YEAR));
		if(hoje.before(dtnasc))
			idade--;
		
		return idade;
	}
	
}
