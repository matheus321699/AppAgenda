package appAgenda;

import java.util.ArrayList;

public class Agenda {
	
	private ArrayList<ContatoBasico> contatos;
	
	Agenda()
	{
		contatos = new ArrayList();
	}
	
	public void inserir(ContatoBasico c)
	{
		contatos.add(c);
	}
	
	public ContatoBasico buscar(String nome)
	{
		for(int i = 0; i<contatos.size(); i++) {
			ContatoBasico c = contatos.get(i);
			
			if(c.getNome().equalsIgnoreCase(nome))
				return contatos.get(i);
		}
		return null;
	}
	
	public ContatoBasico buscar(int pos) {
		if(pos>=0 && pos<contatos.size())  // função size para pegar o tamanho da lista
		{
			return contatos.get(pos);
		}
		
		return null;
	}
	
	public EContato BuscarEmail(String email)
	{
		for(int i=0; i<contatos.size(); i++)
		{
				EContato c = (EContato) contatos.get(i);
				if(c.getEmail().equalsIgnoreCase(email)) {
					return (EContato) contatos.get(i);
				}
			}
		
		return null;
	}
	
	public Contato[] buscarGeral(String palavraChave) {
		ArrayList<ContatoBasico> todos = new ArrayList();
	
		for(int i=0; i<contatos.size(); i++)
		{
			ContatoBasico c = contatos.get(i);
			if(c.getDados().contains(palavraChave))
				todos.add(c);	
		}
		Contato[] vet = new Contato[todos.size()];
		
		return (todos.toArray(vet));
		
	}

	public Contato[] buscarTodos()
	{
		Contato[] vet = new Contato[contatos.size()];
		
		return (contatos.toArray(vet));
	}
	
	public int getQuantidade() {
		return contatos.size();
	}

}

// 
	

