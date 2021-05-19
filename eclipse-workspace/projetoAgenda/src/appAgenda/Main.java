package appAgenda;

import java.util.GregorianCalendar;

public class Main {
	public static void mostrarDados(ContatoBasico obj) {
		
		System.out.println(obj.getDados());
		
		System.out.println(((Contato)obj).getIdade());
		System.out.println("xxxxxxxxxxxxxxxxxxxxxxxxx");
			
	}
	
	public static void main(String[] args) {
		Agenda a;
		a = new Agenda();
		
		Contato cb;
		cb = new Contato("Teste", new GregorianCalendar(1980, 10, 28));
		cb.setTelefones(new Telefone("3333-5555", "Telefone residencial"));
		cb.setTelefones(new Telefone("99111-1111", "Telefone celular"));
		a.inserir(cb);
		
		ContatoComercial cc;
		cc = new ContatoComercial("Lanchonete", "Lanches", "Lan");
		cc.setTelefones(new Telefone("2222-0000", "Telefone residencial"));
		a.inserir(cc);
		
		a.inserir(new EContato("Exemplo", new GregorianCalendar(1975, 2, 22),
				"exemplo@gmail.com", "www.exemplo.com.br"));
		
		ContatoBasico obj = a.buscar("Teste"); // pesquisa por nome
	
		
		System.out.println(obj.getNome());
		
		if(obj != null)
			mostrarDados(obj);
		else 
			System.out.println("Contato não encontrado");
		
		System.out.println(obj.getDados());
		
	}

}
