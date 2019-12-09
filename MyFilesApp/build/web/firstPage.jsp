<!--@author Georgia Papavgeri-->

<%@page import="java.util.ArrayList"%>
<%@page import="model.File"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lato:100,300,300i,400&display=swap" >
        <style>
            body {font-family: "Lato", "Arial", sans-serif;}
        </style>
    </head>
    <body>
        <div class="container justify-content-center">
            <div class="row mb-3 mt-3 justify-content-center sticky-top bg-secondary text-white">
                <h1 class="font-weight-bold p-3">FILE MANAGEMENT SYSTEM</h1>
            </div> 
            <div class="row text-center"> 
                <div class="col text-white" >
                    <div style="background: #00B4DB">
                        <h4 class="display-4">Upload file/s</h4>
                        <form action="upload" method="post" enctype="multipart/form-data" onsubmit="return fileValidation()">
                            <div class="row mr-5 ml-5 mb-5">
                                <div class="col mx-auto mb-5 bg-white shadow rounded p-5"> 
                                    <img src="https://res.cloudinary.com/mhmd/image/upload/v1557366994/img_epm3iz.png" alt="" width="200" class="d-block mx-auto mb-4 rounded-pill">
                                    <label for="fileUpload" class="file-upload btn btn-primary btn-block rounded-pill shadow mx-auto">
                                        <i class="fa fa-search"></i>
                                        <input id="fileUpload" type="file" name="myfile" multiple>
                                    </label>
                                    <label for="upload" class="file-upload btn btn-primary btn-block rounded-pill shadow mx-auto">
                                        <i class="fa fa-upload" aria-hidden="true"></i>
                                        <input type="submit" name="uploadButton" value="Upload" id="upload" style="display: none;">Upload
                                    </label>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="col">
                    <h4 class="display-4">Available files</h4>
                    <table class="table table-stripedx table-hover table-bordered table-white">
                        <thead>
                            <tr class="table-info">
                                <th>ID</th>
                                <th>NAME</th>
                                <th>DOWNLOAD</th>
                                <th>DELETE</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:choose>
                                <c:when test="${empty allfiles}">
                                    <tr>
                                        <td colspan="4">No available files</td>
                                    </tr>
                                </c:when>
                                <c:otherwise>
                                    <c:forEach items="${allfiles}" var="f"> 
                                        <tr>
                                            <td>${f.fileId}</td>
                                            <td>${f.fileName}</td>
                                            <td>
                                                <a href="download?id=${f.fileId}" download="${f.fileName}">Download</a>
                                            </td>
                                            <td>                               
                                                <a href="delete?id=${f.fileId}" onclick="return alert('Are your sure to delete?'); return false">Delete</a>
                                            </td>
                                        </tr> 
                                    </c:forEach>
                                </c:otherwise>
                            </c:choose>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
        <script>
                                                    function fileValidation() {
                                                        const input = document.getElementById('fileUpload');
                                                        // Check if any file is selected. 
                                                        if (input.files.length > 0) {
                                                            // Iterate through selected files and check if any of them has size larger than 4MB
                                                            for (const i = 0; i <= input.files.length - 1; i++) {
                                                                const fsize = input.files.item(i).size;
                                                                const file = Math.round((fsize / 1024));
                                                                if (file >= 4096) {
                                                                    alert("File too Big! Please select a file less than 4MB")
                                                                    return false;
                                                                } else {
                                                                    return true;
                                                                }
                                                            }
                                                        }
                                                    }
        </script> 
    </body>
</html>
