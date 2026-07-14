# Přílohy k bakalářské práci: Nasazení platformy Wazuh

Tento repozitář obsahuje veřejné technické přílohy k bakalářské práci na téma **Integrace a nasazení bezpečnostních systémů s monitorovacími a dohledovými funkcemi v COMPLUS CZ**.

Dostupné soubory slouží jako praktický návod a implementační skript pro nasazení centralizovaného bezpečnostního a monitorovacího systému SIEM/XDR na platformě Wazuh v podnikové infrastruktuře.

## Obsah repozitáře

### 📄 `Wazuh - základní instalace.pdf`
**Dokumentace a návod pro nasazení centrálních komponent**
* Podrobný technický průvodce instalací platformy Wazuh v distribuované architektuře na virtuální stroje (VM).
* IP adresy a DNS názvy jsou FIKTIVNÍ, je potřeba si to upravit podle vlastní infrastrutury pro nasazení.
* Zahrnuje přípravu operačního systému, instalaci prerekvizit, generování interních certifikátů a konfiguraci jednotlivých uzlů: Wazuh Indexer, Wazuh Manager (včetně komponenty Filebeat) a webového rozhraní Wazuh Dashboard.
* Obsahuje také ověření funkčnosti po instalaci a řešení možných problémů (troubleshooting).

### 📜 `wazuh.cmd`
**Nasazovací skript pro GPO (Wazuh Agent Deployment)**
* Dávkový skript (`.cmd`) určený pro hromadné a automatizované nasazení Wazuh agentů na koncové stanice (endpointy) a servery s OS Windows.
* Skript je navržen pro bezobslužnou distribuci prostřednictvím doménových politik (Group Policy Object - GPO) v prostředí Active Directory.
* Skript přijímá na vstupu parametry, takže jej není nutné před každým nasazením upravovat – stačí mu přes GPO předat správné argumenty pro konkrétní organizační jednotku (OU).

## Použití skriptu `wazuh.cmd`

Skript vyžaduje při spuštění 3 parametry v následujícím pořadí:
1. **Verze agenta** (název souboru, např. `wazuh-agent-4.14.5-1.msi`)
2. **IP adresa Wazuh Manageru** (např. `10.20.30.12`)
3. **Zařazení/Skupina** (např. `SERVERY` – skript k tomuto názvu automaticky přidá prefix `WINDOWS-`)

**Příklad lokálního spuštění z příkazové řádky:**
```cmd
wazuh.cmd wazuh-agent-4.14.5-1.msi 10.20.30.12 SERVERY
