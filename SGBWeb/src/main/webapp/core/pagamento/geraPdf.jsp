<%-- 
    Document   : geraPdf
    Created on : 2 de fev. de 2025, 14:05:11
    Author     : usuario
--%>
<%@ page import="com.itextpdf.text.*, com.itextpdf.text.pdf.*, java.io.*" %>
<%
    response.setContentType("application/pdf");
    response.setHeader("Content-Disposition", "attachment; filename=comprovante.pdf");

    try {
        // Obtendo os dados da sessão
        String remetente = (String) session.getAttribute("remetente");
        String metodoPagamento = request.getParameter("metodoPagamento");
        String destinatario = null;
        if("pix".equals(metodoPagamento))
            destinatario = "Centro Federal de Educação Tecnológica";
        else if("transf".equals(metodoPagamento))
            destinatario = (String)session.getAttribute("nomeDestinatario");
        String valor = (String) request.getParameter("recarga");
        String data = (String) session.getAttribute("data");
        // Criando o documento PDF
        Document document = new Document();
        PdfWriter.getInstance(document, response.getOutputStream());
        document.open();

        // Adicionando o conteúdo ao PDF
        document.add(new Paragraph("Comprovante de Transação", FontFactory.getFont(FontFactory.HELVETICA_BOLD, 18)));
        document.add(new Paragraph("\n"));
        document.add(new Paragraph("Remetente: " + remetente));
        document.add(new Paragraph("Destinatário: " + destinatario));
        document.add(new Paragraph("Valor: " + valor));
        document.add(new Paragraph("Data: " + data));

        document.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
%>

