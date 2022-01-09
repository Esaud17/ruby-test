# frozen_string_literal: true

RSpec.describe Balance do
  it "has a version number" do
    expect(Balance::VERSION).not_to be nil
  end

  it "hola -> balanceado" do 
    balance = Balance::BalanceLogic.new
    expect(balance.validate("hola")).to eq(true)
  end 

  it "(hola) -> balanceado" do
    balance = Balance::BalanceLogic.new
    expect(balance.validate("(hola)")).to eq(true)
  end

  it "(() -> desbalanceado" do
    balance = Balance::BalanceLogic.new
    expect(balance.validate("(()")).to eq(false)
  end

  it "()) -> desbalanceado" do
    balance = Balance::BalanceLogic.new
    expect(balance.validate("())")).to eq(false)
  end

  it "(hola)) -> desbalanceado" do
    balance = Balance::BalanceLogic.new
    expect(balance.validate("(hola))")).to eq(false)
  end

  it "(:) -> balanceado" do
    balance = Balance::BalanceLogic.new
    expect(balance.validate("(:)")).to eq(true)
  end

  it "(hola:) -> balanceado" do
    balance = Balance::BalanceLogic.new
    expect(balance.validate("(hola:)")).to eq(true)
  end

  it ":(hola) -> balanceado" do
    balance = Balance::BalanceLogic.new
    expect(balance.validate(":(hola)")).to eq(true)
  end

  it ":(hola:) -> balanceado" do
    balance = Balance::BalanceLogic.new
    expect(balance.validate(":(hola:)")).to eq(true)
  end

  it "no voy (:() -> balanceado " do
    balance = Balance::BalanceLogic.new
    expect(balance.validate("no voy (:()")).to eq(true)
  end

  it "hoy pm: fiesta :):) -> balanceado" do
    balance = Balance::BalanceLogic.new
    expect(balance.validate("hoy pm: fiesta :):)")).to eq(true)
  end

  it ":(( -> desbalanceado" do
    balance = Balance::BalanceLogic.new
    expect(balance.validate(":((")).to eq(false)
  end

  it ":(:(:()) -> balanceado" do
    balance = Balance::BalanceLogic.new
    expect(balance.validate(":(:(:())")).to eq(true)
  end

  it ":(:()):) -> balanceado" do
    balance = Balance::BalanceLogic.new
    expect(balance.validate(":(:()):)")).to eq(true)
  end

  it "a (b (c (d) c) b) a :) -> balanceado " do
    balance = Balance::BalanceLogic.new
    expect(balance.validate("a (b (c (d) c) b) a :)")).to eq(true)
  end

end
