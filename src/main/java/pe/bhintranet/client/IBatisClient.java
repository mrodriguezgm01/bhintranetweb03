package pe.bhintranet.client;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import pe.bhintranet.model.dao.UsuarioDAO;

public class IBatisClient {

	public static void main(String[] args) {
		try {
			System.out.println("IBatisClient started");
			System.out.println(" ");
			// load spring beans
			ApplicationContext ctx = new ClassPathXmlApplicationContext("database.xml");
			System.out.println("Classpath loaded");
			System.out.println(" ");
			UsuarioDAO service = (UsuarioDAO) ctx
					.getBean("usuarioDAO");

			// getTrade
			int tradeId = 1;
                        Long idAfiliado=null;
                        idAfiliado=Long.valueOf("1");
			System.out.println("BEFORE: " + service.selectByLoginName("MRODRIGUEZ1").getNombres());

			// update trade
                        /*
			service.executeTrade(tradeId);
			System.out.println("AFTER : " + service.getTrade(tradeId));
			System.out.println(" ");
			System.out.println("Hurry!!!! Its done!");
                        */
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
