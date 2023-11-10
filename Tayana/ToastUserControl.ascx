<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ToastUserControl.ascx.cs" Inherits="Tayana.ToastUserControl" %>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.0.18/dist/sweetalert2.min.css" />
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.0.18/dist/sweetalert2.all.min.js"></script>

<script>
    function showMessageBox(message, type) {
        Swal.fire({
            icon: type,
            text: message,
            position: 'top-end',
            timer: 3000,
            toast: true,
            showConfirmButton: false
        });
    }
</script>







