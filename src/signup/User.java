package signup;
public class User {
    private String name;
    private String email;
    private String phone;
    private String gender;
    private String aadhaar;
    private String address;
    private String password;
    private String accountNumber;

    public User(String name, String email, String phone,String aadhaar, String address, String password, String accountNumber,String gender) {
        this.name = name;
        this.email = email;
        this.phone = phone;
        this.aadhaar = aadhaar;
        this.address = address;
        this.password = password;
        this.accountNumber = accountNumber;
        this.gender=gender;
    }


    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getAadhaar() {
        return aadhaar;
    }

    public void setAadhaar(String aadhaar) {
        this.aadhaar = aadhaar;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getAccountNumber() {
        return accountNumber;
    }

    public void setAccountNumber(String accountNumber) {
        this.accountNumber = accountNumber;
    }
}
