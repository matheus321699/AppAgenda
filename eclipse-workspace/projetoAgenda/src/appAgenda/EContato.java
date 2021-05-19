package appAgenda;

import java.util.Calendar;

public class EContato extends ContatoBasico{
	
	protected String email, homepage;
	
	public EContato(String nome, Calendar dtnasc, String email, String hp)
	{
		super(nome);
		this.email = email;
		homepage = hp;
	}
	
	@Override
	public String getDados() {
		
		return super.getDados()+ "email: " + email + "\nhomepage:" + homepage + "\nIdade: ";
	}
	
	public String getEmail() {
		return email;
	}
	
	public String getHomepage() {
		return homepage;
	}
}
