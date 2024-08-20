package Bank;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "Accounts")
public class Bank {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "Account_number")
	private long Account_number;
	
	public long getAccount_number() {
		return Account_number;
	}

	public void setAccount_number(long account_number) {
		Account_number = account_number;
	}

	public String getHolder_name() {
		return Holder_name;
	}

	public void setHolder_name(String holder_name) {
		Holder_name = holder_name;
	}

	public Double getBalance() {
		return Balance;
	}

	public void setBalance(Double balance) {
		Balance = balance;
	}

	@Column(name = "Holder_name")
	private String Holder_name;
	
	@Column(name = "Balance")
	private Double Balance;
	
	public Bank() {
		super();
	}
	
	public Bank(long Account_number, String Holder_name, Double Balance) {
		super();
		this.Holder_name = Holder_name;
		this.Balance = Balance;
	}
}
