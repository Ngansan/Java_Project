package RTDRestaurant.View.Main_Frame;

import RTDRestaurant.Controller.Connection.DatabaseConnection;
import RTDRestaurant.Controller.Event.EventMenuSelected;
import RTDRestaurant.Model.ModelNguoiDung;
import RTDRestaurant.View.Component.Staff_Component.MenuS;
import RTDRestaurant.View.Form.MainForm;
import RTDRestaurant.View.Form.Staff_Form.AccountS_Form;
import RTDRestaurant.View.Form.Staff_Form.CusInformation_Form;
import RTDRestaurant.View.Form.Staff_Form.Staff.TableMenuS_Form;
import java.awt.HeadlessException;
import java.awt.Toolkit;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import net.miginfocom.swing.MigLayout;

public class Main_Staff_Frame extends javax.swing.JFrame {

    private MigLayout layout;
    private MenuS menu;
    private MainForm main;
    private ModelNguoiDung user;

    public Main_Staff_Frame() throws HeadlessException, SQLException {
        initComponents();
        init();
        setTitle("Royal TheDreamers Restaurant");
        setIconImage(Toolkit.getDefaultToolkit().getImage(getClass().getResource("/Icons/restaurant (1).png")));
    }

    public Main_Staff_Frame(ModelNguoiDung user) throws SQLException {
        this.user = user;
        initComponents();
        init();
        setTitle("Royal TheDreamers Restaurant");
        setIconImage(Toolkit.getDefaultToolkit().getImage(getClass().getResource("/Icons/information-desk.png")));
    }

    public void init() throws SQLException {
        layout = new MigLayout("fill", "0[]0[100%, fill]0", "0[fill, top]0");
        bg.setLayout(layout);
        menu = new MenuS();

        main = new MainForm();
        menu.addEvent(new EventMenuSelected() {
            @Override
            public void menuSelected(int menuIndex, int subMenuIndex) {
                switch (menuIndex) {
                    case 0 -> {
                        if(subMenuIndex==0){
                            try {
                                main.showForm(new TableMenuS_Form("Tang 1",user,main));
                            } catch (SQLException ex) {
                                Logger.getLogger(Main_Staff_Frame.class.getName()).log(Level.SEVERE, null, ex);
                            }
                        }else if(subMenuIndex==1){
                            try {
                                main.showForm(new TableMenuS_Form("Tang 2",user,main));
                            } catch (SQLException ex) {
                                Logger.getLogger(Main_Staff_Frame.class.getName()).log(Level.SEVERE, null, ex);
                            }
                        }else if(subMenuIndex==2){
                            try {
                                main.showForm(new TableMenuS_Form("Tang 3",user,main));
                            } catch (SQLException ex) {
                                Logger.getLogger(Main_Staff_Frame.class.getName()).log(Level.SEVERE, null, ex);
                            }
                        }
                    }
                    case 1 -> {
                    try {
                        main.showForm(new CusInformation_Form(main));
                    } catch (SQLException ex) {
                        Logger.getLogger(Main_Staff_Frame.class.getName()).log(Level.SEVERE, null, ex);
                    }
                    }
                    case 5 -> {
                    try {
                        main.showForm(new AccountS_Form(user));
                    } catch (SQLException ex) {
                        Logger.getLogger(Main_Staff_Frame.class.getName()).log(Level.SEVERE, null, ex);
                    }
                    }
                    case 6 -> {
                        dispose();
                        Main_LoginAndRegister.main();
                    }
                    default -> {
                    }
                }
            }
        });
        menu.initMenuItem();
        bg.add(menu, "w 265!, spany 2"); //Span Y 2cell
        bg.add(main, "w 100%, h 100%");
        //Form mặc định lúc đăng nhập
        main.showForm(new TableMenuS_Form("Tang 1",user,main));
    }

    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        bg = new javax.swing.JLayeredPane();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);

        bg.setBackground(new java.awt.Color(153, 153, 153));
        bg.setPreferredSize(new java.awt.Dimension(1200, 730));

        javax.swing.GroupLayout bgLayout = new javax.swing.GroupLayout(bg);
        bg.setLayout(bgLayout);
        bgLayout.setHorizontalGroup(
            bgLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGap(0, 1321, Short.MAX_VALUE)
        );
        bgLayout.setVerticalGroup(
            bgLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGap(0, 724, Short.MAX_VALUE)
        );

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(bg, javax.swing.GroupLayout.DEFAULT_SIZE, 1321, Short.MAX_VALUE)
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addComponent(bg, javax.swing.GroupLayout.DEFAULT_SIZE, 724, Short.MAX_VALUE)
                .addGap(1, 1, 1))
        );

        pack();
        setLocationRelativeTo(null);
    }// </editor-fold>//GEN-END:initComponents

    public static void main(String args[]) {
        /* Set the Nimbus look and feel */
        //<editor-fold defaultstate="collapsed" desc=" Look and feel setting code (optional) ">
        /* If Nimbus (introduced in Java SE 6) is not available, stay with the default look and feel.
         * For details see http://download.oracle.com/javase/tutorial/uiswing/lookandfeel/plaf.html 
         */
        try {
            for (javax.swing.UIManager.LookAndFeelInfo info : javax.swing.UIManager.getInstalledLookAndFeels()) {
                if ("Windows".equals(info.getName())) {
                    javax.swing.UIManager.setLookAndFeel(info.getClassName());
                    break;
                }
            }
        } catch (ClassNotFoundException ex) {
            java.util.logging.Logger.getLogger(Main_Staff_Frame.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(Main_Staff_Frame.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(Main_Staff_Frame.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(Main_Staff_Frame.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>

        /* Create and display the form */
//        try {
//            DatabaseConnection.getInstance().connectToDatabase();
//        } catch (SQLException e) {
//            e.printStackTrace();
//        }
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                try {
                    new Main_Staff_Frame().setVisible(true);
                } catch (HeadlessException ex) {
                    Logger.getLogger(Main_Staff_Frame.class.getName()).log(Level.SEVERE, null, ex);
                } catch (SQLException ex) {
                    Logger.getLogger(Main_Staff_Frame.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        });
    }

    public static void main(ModelNguoiDung user) {
        /* Set the Nimbus look and feel */
        //<editor-fold defaultstate="collapsed" desc=" Look and feel setting code (optional) ">
        /* If Nimbus (introduced in Java SE 6) is not available, stay with the default look and feel.
         * For details see http://download.oracle.com/javase/tutorial/uiswing/lookandfeel/plaf.html 
         */
        try {
            for (javax.swing.UIManager.LookAndFeelInfo info : javax.swing.UIManager.getInstalledLookAndFeels()) {
                if ("Windows".equals(info.getName())) {
                    javax.swing.UIManager.setLookAndFeel(info.getClassName());
                    break;
                }
            }
        } catch (ClassNotFoundException ex) {
            java.util.logging.Logger.getLogger(Main_Staff_Frame.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(Main_Staff_Frame.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(Main_Staff_Frame.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(Main_Staff_Frame.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>

        /* Create and display the form */
//        try {
//            DatabaseConnection.getInstance().connectToDatabase();
//        } catch (SQLException e) {
//            e.printStackTrace();
//        }
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                try {
                    new Main_Staff_Frame(user).setVisible(true);
                } catch (SQLException ex) {
                    Logger.getLogger(Main_Staff_Frame.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        });
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JLayeredPane bg;
    // End of variables declaration//GEN-END:variables
}
