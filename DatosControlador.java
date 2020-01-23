/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.defunciones.controladores;

import com.defunciones.dao.UsuarioDAO;
import com.defunciones.entidades.Usuario;
import java.io.ByteArrayInputStream;
import javax.annotation.PostConstruct;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.RequestScoped;
import javax.faces.bean.SessionScoped;
import javax.faces.bean.ViewScoped;
import javax.faces.context.FacesContext;
import javax.faces.event.PhaseId;
import org.primefaces.model.DefaultStreamedContent;
import org.primefaces.model.StreamedContent;

@ManagedBean
@RequestScoped
public class DatosControlador {

    private Usuario usuario;
    private DefaultStreamedContent foto;

    private UsuarioDAO usuarioDAO = new UsuarioDAO();

    public DatosControlador() {
    }

    @PostConstruct
    public void init() {
        usuario = usuarioDAO.recuperarUsuarioPorCedula("1723232323");
        foto = new DefaultStreamedContent(new ByteArrayInputStream(usuario.getFoto()));
    }

    public Usuario getUsuario() {
        return usuario;
    }

    public void setUsuario(Usuario usuario) {
        this.usuario = usuario;
    }

    public UsuarioDAO getUsuarioDAO() {
        return usuarioDAO;
    }

    public void setUsuarioDAO(UsuarioDAO usuarioDAO) {
        this.usuarioDAO = usuarioDAO;
    }

    public DefaultStreamedContent getFoto() {
        return foto;
    }

    public void setFoto(DefaultStreamedContent foto) {
        this.foto = foto;
    }
}
