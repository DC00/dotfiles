---
name: Architectural Decision Record (ADR) Writer
description: Writes ADR documents according to the ADR template. Use when asked to write an ADR document. Use with the ADR Researcher Skill to understand what to write
---

# Architectural Decision Record (ADR) Writer

**CRITICAL**: YOU MUST KEEP THE DOCUMENT UNDER 900 words.

Leverage the `bd` tool for memory management. Fall back to the chromadb mcp server or Claude.

## Instructions
1. Take the output from the ADR Researcher Skill to understand what to write
2. Think and understand how the output from the ADR Researcher Skill applies to each section in the ADR Template
3. Write the ADR document
4. Please try to keep the document to 2-3 pages. If needed I can include schema designs and sequence diagrams in separate tabs
5. Include ASCII diagrams for clarity
6. Put all ASCII diagrams and SQL DDL schemas in an Appendix section which does not count towards the 900 words
7. **CRITICAL**: After writing the ADR to disk, validate the word count:
   - Use bash to count words from start of document to the line before "## Appendix:" or "---" divider
   - If word count exceeds 900 words, immediately revise the document to condense content
   - Report the actual word count to the user
   - Command: `awk '/^---$/,/^## Appendix:/{if(/^## Appendix:/)exit}1' <file> | wc -w`

## Context

Architectural Decision Records (ADRs) are concise documents that capture a single significant technical or architectural decision in context. They are intended to help you understand he reasons for a chosen architectural decision, along with its trade-offs and consequences. The main goal of a formalized ADR is to enable prioritized technical decision making. Secondary goals are
- Preserve institutional knowledge and rationales behind key decisions
- Improve transparency and enable stakeholder awareness and participation
- Support future-proofing, auditing and AI-driven knowledge mining
- Ensure consistent documentation within production-readiness processes.

Separation of ADRs from RFCs and execution plans strengthens clarity, focusing on the why over how. They do not require a full ARB meeting, and are usually finalized with a much smaller audience. However, they are often related to an RFC that has been discussed in the ARB.

## Tenets
- Single decision focus: Each ADR records one architecturally significant decision, concise and clear.
- Immutable: Approved ADRs are immutable. New insights lead to new ADRs that supersede prior ones
- Evidence backed: Decisions include alternatives, pros/cons and trade-offs, grounded in context not opinion
- Shared ownership: Anyone may author ADRs, owners maintain and shepherd them to acceptance
- Structured lifecycle: ADRs follow defined states of draft → proposed → accepted or rejected → superseded


## Template

```markdown
ADR Title (use Title formatting)
ADR 20250807-001 (use Subtitle formatting)

Authors: @Author
Date: (the date)
Status: draft

# Summary (use H1 formatting)
In this section, clearly state the problem space, background context and the proposed direction in a few short paragraphs. Keep it high-level but informative. Explain what the decision is and why it matters, assuming the reader has some context but may not know the technical details yet.

## Context (use H2 formatting)
Provide all necessary background that led to this ADR. Describe the ecosystem, current practices, and relevant standards or constraints. This is where you explain the landscape in which the decision is being made, so readers understand the trade-offs and boundaries. Keep the tone descriptive and factual.

Break down the problem and solution to four sections.

### Problem statement (use H3 formatting)
Define the core problem in a focused, concrete way. Write as if explaining to someone technical who isn’t deeply familiar with your system. Emphasize the key challenge this ADR is attempting to resolve.

### Problem impact (use H3 formatting)
Lay out why the problem matters. Describe the risks, limitations, or pain points caused by the current approach or lack of one. Discuss both technical and operational consequences, ideally grouped by theme but written as full paragraphs.

### Solution (use H3 formatting)
Explain the proposed approach and how it solves the identified problem. Be specific about how it works and how it will be implemented. Avoid overly abstract descriptions, aim for both clarity and completeness. Use plain language and include standards or protocols being adopted or extended.

### Solution impact (use H3 formatting)
Describe how the solution changes the system’s security posture, architecture, or development processes. Note improvements, risk reductions, and benefits. Make it clear why this is the preferred approach. Call out operational implications, developer experience changes, and long-term benefits.

## Decision (use H2 formatting)
Capture the formal choice being made. Explain what will be done, how it will be enforced, and who is expected to follow this guidance. Reference related standards or practices where relevant. Provide precise expectations for implementers and consumers of the change. This is he heart of the ADR, so be precise and detailed.

## Consequences (use H2 formatting)
Highlight downstream effects of the decision, both positive and negative. Mention anything that becomes easier or harder, and what new responsibilities or requirements will exist. Acknowledge trade-offs or added complexity, and suggest mitigations if relevant.

## Alternatives (use H2 formatting)
List other options that were considered and explain why they were not chosen. Describe their merits and limitations. This section shows that the decision was deliberate and that other viable paths were weighed carefully. Provide links to RFCs or standards considered.
```

General Writing Guidelines
- Avoid rhetorical questions
- Avoid creating too many subheaders and just use the defined Headings in the template. We want to save on length and cut down on new lines
- For the Problem Impact and Solution Impact section, use circular bulleted lists to drive the points home. Do not include more than three bullets for each
- For the Consequences and Alternaatives sections, use **bolded** words with explanations. Do not include a Mitigations section

Advice for keeping the ADR document short
- Do not include more than two alternatives
- The list of Consequences should be very short
- The Decision section should be very short