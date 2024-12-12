import type { ReactNode } from "react";

const KINDS = {
  info: "#3498db",
  success: "#2ED573",
  error: "#FF4757",
  warning: "#FFA502",
};

export type AlertProps = {
  kind: "info" | "success" | "error" | "warning";
  children: ReactNode;
};

export default function Alert({ children, kind = "info" }: AlertProps) {
  return (
    <div
      style={{
        padding: 10,
        background: "white",
        color: "white",
        backgroundColor: KINDS[kind],
        borderRadius: 8,
        margin: 4,
        opacity: .9,
        border: 3,
        bevel: 3,
      }}
    >
      {children}
    </div>
  );
}
