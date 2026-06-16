<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Author Registration</title>
    </head>
    <body>
        <div class="container">
            <h1>Author Registration Form</h1>
            <form action="processAuthor.jsp" method="POST">
                <div class="form-group">
                    <label>Author No:</label>
                    <input type="text" name="authno" required placeholder="e.g., A001">
                </div>
                <div class="form-group">
                    <label>Name:</label>
                    <input type="text" name="name" required>
                </div>
                <div class="form-group">
                    <label>Address:</label>
                    <input type="text" name="address">
                </div>
                <div class="form-group">
                    <label>City:</label>
                    <input type="text" name="city">
                </div>
                <div class="form-group">
                    <label>State:</label>
                    <select name="state">
                        <option value="">Select State</option>
                        <option value="Johor">Johor</option>
                        <option value="Kedah">Kedah</option>
                        <option value="Kelantan">Kelantan</option>
                        <option value="Melaka">Melaka</option>
                        <option value="Negeri Sembilan">Negeri Sembilan</option>
                        <option value="Pahang">Pahang</option>
                        <option value="Penang">Penang</option>
                        <option value="Perak">Perak</option>
                        <option value="Perlis">Perlis</option>
                        <option value="Sabah">Sabah</option>
                        <option value="Sarawak">Sarawak</option>
                        <option value="Selangor">Selangor</option>
                        <option value="Terengganu">Terengganu</option>
                        <option value="Kuala Lumpur">Kuala Lumpur</option>
                        <option value="Labuan">Labuan</option>
                        <option value="Putrajaya">Putrajaya</option>
                    </select>
                </div>
                <div class="form-group">
                    <label>Zip Code:</label>
                    <input type="text" name="zip">
                </div>
                <div class="btn-group">
                    <button type="submit" class="btn-submit">Submit</button>
                    <button type="reset" class="btn-cancel">Cancel</button>
                </div>
            </form>
        </div>
    </body>
</html>